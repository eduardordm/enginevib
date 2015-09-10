module Enginevib
  # Defines a sensor class which can read data from virtual ports, non-blocking.
  class Sensor
    attr_accessor :fd, :io, :buffered_data, :simulation_mode

    def initialize(serial_port, simulation_mode)
      @simulation_mode = simulation_mode
      init_io(serial_port)
    end

    def read
      @buffered_data =
        @simulation_mode ? rand(0.10..1.00) : @io.readline_nonblock.to_f
    rescue
      @buffered_data
    end

    private

    def init_io(serial_port)
      return if @simulation_mode
      @fd = IO.sysopen(serial_port, 'r')
      @io = IO.new(fd, 'r')
    end
  end
end
