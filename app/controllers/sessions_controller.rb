class SessionsController < ApplicationController
  def create
    req = request.env["omniauth.auth"]
    @bool = user_is_new?(req)
    @user = User.find_or_create_by_auth(req)
    session[:user_id] = @user.id
    @bool ? new_user_path : old_user_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_is_new?(req)
    !User.find_by(uid: req["uid"])
  end

  def new_user_path
    flash[:notice] = "Welcome #{@user.name.capitalize}!"
    redirect_to edit_user_path(current_user.id)
  end

  def old_user_path
    flash[:notice] = "You are logged in as #{@user.name.capitalize}"
    redirect_to pairs_path
  end
end
