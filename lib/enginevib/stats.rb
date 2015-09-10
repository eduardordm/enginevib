module Enginevib
  # A PORO. Should be faster than struct and hash.
  class Stats
    attr_accessor :warning, :window, :memory, :window_avg

    def initialize
      @warning = false
      @window = 0
      @memory = 0
      @window_avg = 0
    end
  end
end
