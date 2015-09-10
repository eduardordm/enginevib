require 'test_helper'

class SensorTest < Minitest::Test
  def test_must_run_simulation
    sensor = Enginevib::Sensor.new(nil, true)
    refute_nil sensor.read
  end

  def test_must_read_device
    sensor = Enginevib::Sensor.new("test/fixtures/dummy", false)
    assert_equal 1234.0, sensor.read
  end
end
