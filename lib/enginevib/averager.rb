module Enginevib
  # Defines the Averager class
  class Averager
    AVERAGE_SAMPLE_SIZE = 100

    def initialize(size = AVERAGE_SAMPLE_SIZE)
      @size = size
      @nums = []
      @sum = 0.0
    end

    def <<(hello)
      @nums << hello
      goodbye = @nums.length > @size ? @nums.shift : 0
      @sum += hello - goodbye
      self
    end

    def average
      @sum / @nums.length
    end

    def to_s
      average.to_s
    end
  end
end
