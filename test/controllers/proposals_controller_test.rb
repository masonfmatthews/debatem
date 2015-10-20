require 'test_helper'

class ProposalsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create, proposal: {user_id: users(:one).id, title: "Title", body: "Body"}
    assert_redirected_to proposals_path
  end

end
