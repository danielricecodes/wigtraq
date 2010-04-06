require 'test_helper'

class BuckTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Buck.new.valid?
  end
end
