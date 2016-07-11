require 'test_helper'

class ComenControllerTest < ActionDispatch::IntegrationTest
  test "should get comentarios" do
    get comen_comentarios_url
    assert_response :success
  end

end
