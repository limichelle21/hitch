class ApplicationController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    respond_to :html, :json

    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    skip_before_action :verify_authenticity_token

    def index
        render 'application/index'
    end
    
    
    protected
    
    def configure_permitted_parameters
        added_attrs = [:username, :email, :password, :password_confirmation]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
    
end
