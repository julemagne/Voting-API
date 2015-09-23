require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert response.body.include?("Julie")
  end

  test "show is specific" do
    get :show, id: candidates(:one).id
    assert_response :success
    assert response.body.include?("Julie")
    refute response.body.include?("Angela")
  end
end
