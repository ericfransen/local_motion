class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    user.save
    if user.save
      redirect_to new_trip_path#, notice: "You successfully signed in."
      flash[:notice] = "You successfully signed in."
    else
      omniauth_failure
    end
  end

  def omniauth_failure
    redirect_to root_url#, notice: "UBER authentication failed."
    flash[:failure] =  'UBER authentication failed.'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url#, notice: "You successfully signed out."
    flash[:log_out] =  'You successfully logged out.'
  end
end
