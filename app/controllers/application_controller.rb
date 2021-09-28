class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:profile,:prefecture,:phone_number, :last_name, :first_name, :age, :job, :profile])
  end
end

