class PairsController < ApplicationController
  def index
    flash[:error] = "Please sign in if you want to visit this page."
    redirect_to root_path
  end
end
