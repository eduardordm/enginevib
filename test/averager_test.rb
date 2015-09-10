require 'test_helper'

class AveragerTest < Minitest::Test
  def test_average_must_be_correct
    avg = Enginevib::Averager.new(10)

    avg << 15
    avg << 5

    assert_equal 10, avg.average

    avg << 40

    assert_equal 20, avg.average
  end
end
