require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get account_login_url
    assert_response :success
  end

  test "should get crear_cuenta" do
    get account_crear_cuenta_url
    assert_response :success
  end

  test "should get recuperar_cuenta" do
    get account_recuperar_cuenta_url
    assert_response :success
  end

end
