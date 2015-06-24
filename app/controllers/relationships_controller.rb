class RelationshipsController < ApplicationController
  before_action :authorize

  def index
    @possible_matches = User.all_except(current_user)
  end

  def create

  end

  def destroy

  end

end
