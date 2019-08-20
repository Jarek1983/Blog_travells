require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  test "should get resource articles" do
    get articles_path
    assert_response :success
  end

end
