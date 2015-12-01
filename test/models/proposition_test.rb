require 'test_helper'

class PropositionTest < ActiveSupport::TestCase
  test "percentage agreement" do
    assert_equal 50, propositions(:one).percentage_agreement
    claims(:two).destroy
    assert_equal 0, propositions(:one).reload.percentage_agreement
  end
end
