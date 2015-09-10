module Enginevib
  # Defines a controller which can be operated by external tools
  class Controller
    attr_accessor :inop
    def initialize
      @inop = false
    end
  end
end
