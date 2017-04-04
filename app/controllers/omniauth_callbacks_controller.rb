class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # the from_omniauth method is from the User model method, this is where we try to get the user from the database first
    @user = User.from_omniauth(request.env["omniauth.auth"])

    # if user has persisted, that is, if the user is in the database  we will sign in and redirect their page and tell them they have successfully signed in with facebook
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      # otherwise we will redirect to the sign up page
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
     # You need to implement the method below in your model (e.g. app/models/user.rb)
     @user = User.from_omniauth(request.env["omniauth.auth"])

     if @user.persisted?
       flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
       sign_in_and_redirect @user, :event => :authentication
     else
       session["devise.google_data"] = request.env["omniauth.auth"].except(:extra) #Removing extra as it can overflow some session stores
       redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
     end
  end

end
