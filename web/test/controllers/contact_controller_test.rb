require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get contactenos" do
    get contact_contactenos_url
    assert_response :success
  end

end
