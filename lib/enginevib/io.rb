# Non-blocking patch. I'm a terrible person.
class IO
  def readline_nonblock
    rlnb_buffer = ''
    until (ch = read_nonblock(1)).nil?
      rlnb_buffer << ch
      if ch == "\n"
        result = rlnb_buffer
        return result
      end
    end
  end
end
