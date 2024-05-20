require "test_helper"

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_index_url
    assert_response :success
  end

  test "should get submit" do
    get quiz_submit_url
    assert_response :success
  end
end
