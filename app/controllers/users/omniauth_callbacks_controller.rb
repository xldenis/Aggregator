class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  #Callback to add facebook feeds
  def facebook
    # Redirect the user if he isn't already logged in
    unless current_user
      redirect_to new_user_session_path
    else
    user = current_user
    Feed.create_or_update(request.env["omniauth.auth"],user)
    redirect_to :back 
    end
    end
end
