require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  test "parents" do
    assert_equal nil, positions(:one).parent
    assert_equal positions(:one), positions(:two).parent
  end

  test "responses" do
    assert_equal [positions(:two)], positions(:one).responses
    assert_equal [], positions(:two).responses
  end
end
