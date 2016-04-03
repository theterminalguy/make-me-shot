#require 'test_helper'
#
#class RegistrationsControllerTest < ActionController::TestCase
#
#  def setup 
#    @controller = RegistrationsController.new
#    @request    = ActionController::TestRequest.new
#    @response   = ActionController::TestResponse.new
#    @request.env["devise.mapping"] = Devise.mappings[:user]
#    @user = Registrations.new(username: "John", email: "john@test.com")
#  end
#
#  setup do 
#    @user= users(:one) 
#  end
#
#  test "should create user" do # then you test cases for controller
#    sign_in users(:one)
#    post :create, users:{email:'test@test.com', password: 'password'}
#    assert_response :success 
#  end
#
#end