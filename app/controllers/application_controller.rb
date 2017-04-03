class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # DEVISE - before any action, this is going to happen which is called the configure_permitted_paramters method if it is a devise controller and it is making sure the sign_up and account_update has the fullname in it.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:fullname])
    end
    # https://github.com/plataformatec/devise/blob/master/CHANGELOG.md#400rc1---2016-02-01
end

# For more information: http://guides.rubyonrails.org/active_record_validations.html
