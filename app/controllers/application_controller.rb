class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :name, :address, :mobile, :birth_date, :sex, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs  #{ |u| u.permit(:name, :address, :mobile, :birth_date, :sex, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name) }
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs #{ |u| u.permit(:name, :address, :mobile, :birth_date, :sex, :email, :password, :password_confirmation, :current_password, :first_name, :last_name) }
  end
end
