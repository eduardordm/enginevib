module Enginevib
  # Defines the system class
  class System
    attr_accessor :averager

    def initialize
      @averager = Averager.new
    end

    def compute(data)
      @averager << data
      format('%2.1f', (@averager.average * 10.0))
    end
  end
end
