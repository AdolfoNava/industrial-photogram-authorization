class ApplicationController < ActionController::Base
  include Pundit
  
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :private, :name, :bio, :website, :avatar_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :private, :name, :bio, :website, :avatar_image])
  end
end
