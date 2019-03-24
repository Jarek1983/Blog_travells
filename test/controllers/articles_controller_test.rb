require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Blog"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get index" do
    get articles_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

end
