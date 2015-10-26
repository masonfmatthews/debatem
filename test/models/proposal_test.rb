require 'test_helper'

class ProposalTest < ActiveSupport::TestCase
  test "percentage agreement" do
    assert_equal 50, proposals(:one).percentage_agreement
    positions(:two).destroy
    assert_equal 0, proposals(:one).percentage_agreement
  end
end
