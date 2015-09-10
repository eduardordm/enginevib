require 'curses'

module Enginevib
  # Defines an output class
  class Output
    attr_accessor :screen, :window

    attr_writer :warning

    def initialize
      return if $TEST
      init_renderer
    end

    def refresh_display(data, stats)
      return if $TEST
      render_message data, stats
    end

    private

    def init_renderer
      setup_curses
      @window = Curses::Window.new(8, 23,
                                   (Curses.lines - 8) / 2,
                                   (Curses.cols - 23) / 2)
    end

    def setup_curses
      Curses.tap do |c|
        c.init_screen
        c.nonl
        c.cbreak
        c.noecho
        c.curs_set(0)
        @screen = c.stdscr
      end
      @screen.scrollok(false)
    end

    def render_message(data, stats)
      @window.tap do |w|
        w.setpos(2, 3)
        w.addstr(data.to_s)
        w.setpos(4, 3)

        wnd = stats.window_avg
        st = stats.warning ? 'WARN' : 'OP  '

        w.addstr(">>#{st}/#{stats.memory}/#{wnd} ms   ")
        w.refresh
      end
    end
  end
end
