module Enginevib
  # Defines the soft ticker methods as a replacement for Rtos
  module SoftTicker
    def preempt_rt
      yield
    end

    def delay_rt(t_seconds)
      sleep(t_seconds)
    end
  end
end
