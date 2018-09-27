require 'test_helper'

class MovementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get movements_index_url
    assert_response :success
  end

end
