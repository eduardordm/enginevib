require 'test_helper'

class SchedulerTest < Minitest::Test
  def test_deadline_must_be_met
    main = Enginevib::Main.new
    (1..100).each { assert main.scheduler.tick }
  end
end
