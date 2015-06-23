class UsersController < ApplicationController
  def edit
    @languages = Language.all
  end
end
