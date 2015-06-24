class UsersController < ApplicationController
  def show
    @matches = User.find(Relationship.potential_matches(current_user))
  end

  def edit
    @languages = Language.all
  end

  def update
    language_ids = (params[:user].find_all { |k,v| v == "1" }).map {|arr| arr[0]}

    if current_user.update(description: params[:user][:description])
      update_user_languages(current_user, language_ids)

      redirect_to user_path(current_user)
    else
      flash[:error] = "Please use 500 words or fewer."
      redirect_to :back
    end
  end

  private

  def update_user_languages(current_user, language_ids)
    UserLanguage.where(user_id: current_user.id).destroy_all

    language_ids.each do |language_id|
      UserLanguage.create(user_id: current_user.id, language_id: language_id)
    end
  end
end
