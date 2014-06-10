require 'test_helper'

class MessageControllerTest < ActionController::TestCase
  test "should get send_push" do
    get :send_push
    assert_response :success
  end

end
