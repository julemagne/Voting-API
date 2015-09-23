require 'test_helper'

class VotersControllerTest < ActionController::TestCase

  test "show is specific" do
    get :show, id: voters(:one).id
    assert_response :success
    assert response.body.include?("David")
    refute response.body.include?("Michelle")
  end

  test "should post create" do
    post :create
    assert_response :success
  end

  test "should delete destroy" do
    delete :destroy, id: voters(:one).id
    assert_response :success
    get :index
    refute response.body.include?("David")
  end

  test "should patch update" do
    patch :update
    assert_response :success
  end
end
