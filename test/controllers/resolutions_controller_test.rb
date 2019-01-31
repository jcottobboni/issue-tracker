require 'test_helper'

class ResolutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resolution = resolutions(:one)
  end

  test "should get index" do
    get resolutions_url
    assert_response :success
  end

  test "should get new" do
    get new_resolution_url
    assert_response :success
  end

  test "should create resolution" do
    assert_difference('Resolution.count') do
      post resolutions_url, params: { resolution: { string: @resolution.string } }
    end

    assert_redirected_to resolution_url(Resolution.last)
  end

  test "should show resolution" do
    get resolution_url(@resolution)
    assert_response :success
  end

  test "should get edit" do
    get edit_resolution_url(@resolution)
    assert_response :success
  end

  test "should update resolution" do
    patch resolution_url(@resolution), params: { resolution: { string: @resolution.string } }
    assert_redirected_to resolution_url(@resolution)
  end

  test "should destroy resolution" do
    assert_difference('Resolution.count', -1) do
      delete resolution_url(@resolution)
    end

    assert_redirected_to resolutions_url
  end
end
