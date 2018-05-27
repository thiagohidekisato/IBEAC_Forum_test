require 'test_helper'

class Backoffice::TopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_topics_index_url
    assert_response :success
  end

end
