require 'test_helper'

class ControllerTest < Minitest::Test
  def test_must_be_always_on
    controller = Enginevib::Controller.new
    assert !controller.inop
  end
end
