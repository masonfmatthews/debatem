require 'test_helper'

class MockupsControllerTest < ActionController::TestCase
  test "should get propositions_index" do
    get :propositions_index
    assert_response :success
  end

  test "should get propositions_show" do
    get :propositions_show
    assert_response :success
  end

  test "should get claims_new" do
    get :claims_new
    assert_response :success
  end

  test "should get propositions_graph" do
    get :propositions_graph
    assert_response :success
  end

end
