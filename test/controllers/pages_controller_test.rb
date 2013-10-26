require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get cardio" do
    get :cardio
    assert_response :success
  end

  test "should get diet" do
    get :diet
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
