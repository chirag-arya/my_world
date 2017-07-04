require 'test_helper'

class VideoRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get video_rooms_index_url
    assert_response :success
  end

  test "should get create" do
    get video_rooms_create_url
    assert_response :success
  end

  test "should get party" do
    get video_rooms_party_url
    assert_response :success
  end

  test "should get config_opentok" do
    get video_rooms_config_opentok_url
    assert_response :success
  end

end
