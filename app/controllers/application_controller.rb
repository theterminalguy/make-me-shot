class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
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
