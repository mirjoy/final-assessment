class UsersController < ApplicationController
  def show
  end

  def edit
    @languages = Language.all
  end

  def update
    language_ids = (params[:user].find_all { |k,v| v == "1" }).map {|arr| arr[0]}
    current_user.update(description: params[:user][:description])
    UserLanguage.where(user_id: current_user.id).destroy_all

    language_ids.each do |language_id|
      UserLanguage.create(user_id: current_user.id, language_id: language_id)
    end

    redirect_to user_path(current_user)
  end
end
