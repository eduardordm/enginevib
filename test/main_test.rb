require 'test_helper'

class MainTest < Minitest::Test
  def test_must_initialize_components
    main = Enginevib::Main.new
    refute_nil main.controller
    refute_nil main.sensor
    refute_nil main.output
  end

  def test_must_initialize_scheduler
    main = Enginevib::Main.new
    refute_nil main.scheduler
  end

  def test_deadline_must_be_met
    main = Enginevib::Main.new
    (1..100).each { assert main.scheduler.tick }
  end
end
