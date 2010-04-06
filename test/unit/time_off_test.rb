require 'test_helper'

class TimeOffTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TimeOff.new.valid?
  end
end
