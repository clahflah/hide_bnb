class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :image, :bio])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :image, :bio])
  end
end
