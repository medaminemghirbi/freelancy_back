require "test_helper"

class PayementControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get payement_new_url
    assert_response :success
  end

  test "should get create" do
    get payement_create_url
    assert_response :success
  end
end
