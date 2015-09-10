require 'test_helper'

class SystemTest < Minitest::Test
  def test_computed_data_must_be_computed
    sys = Enginevib::System.new
    assert_equal '1.2', sys.compute(0.12)
  end
end
