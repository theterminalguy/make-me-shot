class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  before_filter :authenticate_user!
  
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session 
  before_filter :configure_devise_params, if: :devise_controller?
  
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:full_name, :email, :password, :password_confirmation)
    end
  end
  
  def after_sign_in_path_for(resource)
    user_dashboard_path 
  end
end
