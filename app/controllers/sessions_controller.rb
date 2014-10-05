class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    # binding.pry
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, notice: "You successfully signed in."
  end

  def omniauth_failure
    redirect_to root_url, notice: "UBER authentication failed."
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You successfully signed out."
  end

end
