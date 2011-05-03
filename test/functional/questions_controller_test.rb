require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get chooseQuestion" do
    get :chooseQuestion
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
