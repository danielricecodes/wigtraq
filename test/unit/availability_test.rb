require 'test_helper'

class AvailabilityTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Availability.new.valid?
  end
end
