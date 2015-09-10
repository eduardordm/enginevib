require 'test_helper'

class IoTest < Minitest::Test
  def test_must_add_readline_nonblock_feature
    fd = IO.sysopen("test/fixtures/dummy", 'r')
    io = IO.new(fd, 'r')

    assert io.respond_to? :readline_nonblock
  end
end
