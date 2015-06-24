class RelationshipsController < ApplicationController
  before_action :authorize

  def index
    @possible_matches = User.all
  end
end
