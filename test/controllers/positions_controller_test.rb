require 'test_helper'

class PositionsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: positions(:one).id, proposal_id: proposals(:one).id
    assert_response :success
  end

  test "should get new" do
    get :new, proposal_id: proposals(:one).id
    assert_response :success
  end

  test "should post create" do
    post :create, proposal_id: proposals(:one).id,
        position: {title: "Title", body: "Body", user_id: users(:one), proposal_id: proposals(:one)}
    new_position = assigns(:position)
    assert_redirected_to proposal_position_path(proposals(:one), new_position)
  end

end
