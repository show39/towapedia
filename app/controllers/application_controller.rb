class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger

  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :title, :profile, :thumbnail])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :title, :profile, :thumbnail])
  end

end
