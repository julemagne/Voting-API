require 'test_helper'

class VotersControllerTest < ActionController::TestCase

  test "show is specific" do
    get :show, id: voters(:one).id
    assert_response 401
    request.headers["HTTP_AUTHORIZATION"] = %{Token #{voters(:three).token}}
    get :show, id: voters(:three).id
    assert response.body.include?("Lauren")
    refute response.body.include?("Michelle")
  end

  test "should post create" do
    post :create
    assert_response :success
  end

  # test "should delete destroy" do
  #   delete :destroy, id: voters(:one).id, token: voters(:one).token
  #   assert_response :success
  #   get :index
  #   refute response.body.include?("David")
  # end

  test "should patch update" do
    patch :update, id: voters(:one).id, token: voters(:one).token
    v = Voter.find_by_token(params[:token])
    v.update(name: params[:name], party: params[:party])
    render json: v.to_json
    assert_response 401
    request.headers["HTTP_AUTHORIZATION"] = %{Token #{voters(:one).token}}
    assert_response 401
  end
end
