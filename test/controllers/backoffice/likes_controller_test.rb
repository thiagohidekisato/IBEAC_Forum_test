require 'test_helper'

class Backoffice::LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_likes_index_url
    assert_response :success
  end

end
