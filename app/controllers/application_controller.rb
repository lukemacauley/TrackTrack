class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_timezone
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	root_path
	end

  protected

  	def configure_permitted_parameters
  	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :bmr, :weight, :name) }
  	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :bmr, :weight, :protein_intake, :fat_percentage, :password, :name, :timezone) }
  	end

  private

    def set_timezone
      tz = current_user ? current_user.timezone : nil
      Time.zone = tz || ActiveSupport::TimeZone["London"]
    end

end