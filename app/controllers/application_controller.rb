# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fullname, :phone, :address, :province_id, :city, :postalcode, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:fullname, :phone, :address, :province_id, :city, :postalcode, :email, :password, :current_password) }
  end
end
