require 'test_helper'

class PropositionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create, proposition: {user_id: users(:one).id, title: "Title", body: "Body"}
    assert_redirected_to propositions_path
  end

end
