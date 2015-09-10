require 'test_helper'

class SofTickerTest < Minitest::Test
  def test_must_comply_with_contract
    Enginevib::SoftTicker.respond_to? :preempt_rt
    Enginevib::SoftTicker.respond_to? :delay_rt
  end
end
