class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permited_parameters, if: :devise_controller?


  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:username, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar]) 
  end
end
