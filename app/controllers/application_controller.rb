class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # CanCan Rescue
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  # Cancan ActiveModel::ForbiddenAttributesError Hack
  # Gets problematic with ActiveAdmin
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :username, :is_company, :slug, :roles_mask]
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :username, :company, :city, :avatar, :is_company, :slug, :slogan, :roles_mask, :cover, :website, :gcv]
  end

end
