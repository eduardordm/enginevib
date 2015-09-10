require 'test_helper'

class StatsTest < Minitest::Test
  def test_must_initialize
    stats = Enginevib::Stats.new
    refute_nil stats
  end

  def test_must_initialize_with_default_values
    stats = Enginevib::Stats.new
    assert_equal false, stats.warning
    assert_equal 0, stats.window
    assert_equal 0, stats.memory
    assert_equal 0, stats.window_avg
  end
end
