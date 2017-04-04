class RegistrationsController < Devise::RegistrationsController

  protected
  # this method is from Devise
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

end
