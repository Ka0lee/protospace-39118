class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :email, :encrypted_password, :password_confirmation, :user_profile, :user_occupation, :user_position])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:user_name, :email, :encrypted_password, :password_confirmation, :user_profile, :user_occupation, :user_position])
  end
  
  
end
