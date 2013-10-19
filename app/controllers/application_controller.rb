class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	root_path
	end

  protected

  	def configure_permitted_parameters
  	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :bmr, :weight) }
  	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :bmr, :weight, :protein_intake, :fat_percentage, :password) }
  	end

end