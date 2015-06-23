class SessionsController < ApplicationController
  def create
    req = request.env["omniauth.auth"]
    @user = User.find_or_create_by_auth(req)
    session[:user_id] = @user.id
    flash[:notice] = "You are logged in as #{@user.name.capitalize}"
    redirect_to pairs_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
