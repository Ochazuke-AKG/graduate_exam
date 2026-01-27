require "test_helper"

class DiariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diaries_index_url
    assert_response :success
  end

  test "should get new" do
    get diaries_new_url
    assert_response :success
  end

  test "should get create" do
    get diaries_create_url
    assert_response :success
  end
end
