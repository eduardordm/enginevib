module Enginevib
  # The main class. run is called when run from command line.
  class Main
    include Launcher
    attr_accessor :scheduler, :sensor, :output, :system, :controller

    DEADLINE  = 30.0 / 1000.0  # 30 milliseconds
    TOLERANCE = 7.0 / 1000.0   # 7 miliseconds
    AVERAGE_SAMPLE_SIZE = 100  # 100 ticks

    def initialize
      parse_arguments
      initialize_components
      initialize_scheduler
    end

    def initialize_components
      @sensor = Sensor.new(@options[:serial_port], @options[:simulation_mode])
      @output = Output.new
      @system = System.new
      @controller = Controller.new
    end

    def initialize_scheduler
      @scheduler = Scheduler.new(DEADLINE, TOLERANCE) do |stats|
        if @controller.inop
          sleep DEADLINE - TOLERANCE
        else
          data = @sensor.read
          computed_data = @system.compute(data)
          @output.refresh_display(computed_data, stats)
        end
      end
    end

    def start_scheduler
      @scheduler.start
    end
  end
end
