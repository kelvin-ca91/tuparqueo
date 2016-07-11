require 'test_helper'

class ParkinControllerTest < ActionDispatch::IntegrationTest
  test "should get nuevo" do
    get parkin_nuevo_url
    assert_response :success
  end

end
