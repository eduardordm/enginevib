require 'optparse'
module Enginevib
  # Defines the Launcher module which must be defined in Main.rb
  module Launcher
    attr_accessor :options

    def launch
      start_scheduler
    rescue SystemExit, Interrupt
      puts 'Good bye!' # May not be printed since we are using curses.
    end

    def parse_arguments
      @options = {
        simulation_mode: true,
        serial_port: nil
      }
      OptionParser.new do |opts|
        opts.banner = 'Usage: enginevib [options]'
        on_simulation_mode(opts)
        on_serial_port(opts)
        on_help(opts)
      end.parse!
    end

    private

    def on_simulation_mode(opts)
      opts.on('-s',
              '--simulation-mode',
              'Enables the simulation mode and ignores --serial-port') do |s|
        @options[:simulation_mode] = s
      end
    end

    def on_serial_port(opts)
      opts.on('-pSERIAL_PORT',
              '--serial-port=SERIAL_PORT',
              'Serial device to read data from. Example: /dev/ttys005') do |p|
        @options[:serial_port] = p
      end
    end

    def on_help(opts)
      opts.on('-h', '--help', 'Prints this help') do
        puts opts
        exit
      end
    end
  end
end
