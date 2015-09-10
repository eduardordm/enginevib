require 'rtos'

module Enginevib
  # Defines the scheduler class
  class Scheduler
    include $SOFT_TICKER ? SoftTicker : Rtos

    attr_accessor :deadline, :block, :tolerance, :stats, :averager, :inop

    def initialize(deadline, tolerance, &block)
      @deadline = deadline
      @block = block
      @tolerance = tolerance
      @stats = Stats.new
      @averager = Averager.new
    end

    def start
      preempt_rt { loop { tick } }
    end

    def tick
      execution_time = execute_block

      actual_wait_time = wait_for_next_tick(execution_time)

      measure_time = measure_execution(execution_time, actual_wait_time)

      verify_measure_time(execution_time, actual_wait_time, measure_time)
    end

    private

    def execute_block
      Benchmark.realtime do
        @block.call @stats
        GC.start
      end
    end

    def wait_for_next_tick(execution_time)
      Benchmark.realtime do
        delay_rt([@deadline - execution_time - tolerance, 0].max)
      end
    end

    def measure_execution(execution_time, actual_wait_time)
      Benchmark.realtime do
        @stats.tap do |s|
          s.memory =
            GC.stat(:total_allocated_objects) - GC.stat(:total_freed_objects)
          s.window = execution_time + actual_wait_time
          s.warning = @stats.window > @deadline
          measure_execution_avg
        end
      end
    end

    def measure_execution_avg
      @averager << @stats.window * 1000
      @stats.window_avg = @averager.average.to_i
    end

    def verify_measure_time(execution_time, actual_wait_time, measure_time)
      @stats.warning =
        (execution_time + actual_wait_time + measure_time) > @deadline
      !@stats.warning
    end
  end
end
