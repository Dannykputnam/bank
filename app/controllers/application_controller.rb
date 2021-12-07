class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session 
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected 
    # private
    #   def signup_params
    #     params.require(:sign_up).permit(:email, :password)
    #     params.require(:sign_up).permit(:email, :password, :first_name, :last_name)
    #   end
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end
end