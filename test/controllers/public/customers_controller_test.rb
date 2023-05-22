require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_customers_update_url
    assert_response :success
  end

  test "should get cancellation" do
    get public_customers_cancellation_url
    assert_response :success
  end

  test "should get withdrawal" do
    get public_customers_withdrawal_url
    assert_response :success
  end
end
