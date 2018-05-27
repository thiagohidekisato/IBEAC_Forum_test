require 'test_helper'

class Backoffice::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_comments_index_url
    assert_response :success
  end

end
