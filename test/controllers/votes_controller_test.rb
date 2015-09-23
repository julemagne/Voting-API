require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should post create" do
    post :create
    assert_response :success
  end

  test "should delete destroy" do
    delete :destroy, id:votes(:one).id
    assert_response :success
  end

end
