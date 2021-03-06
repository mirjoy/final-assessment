class RelationshipsController < ApplicationController
  before_action :authorize

  def index
    if best_matches
      @possible_match = best_matches
    else
      @possible_match = second_best_matches
    end
  end

  def create
    @match_id = params[:relationship][:match_id]

    if check_this_relationship_exists_and_update(@match_id)
    else
      @relationship = Relationship.new(action_user_id: current_user.id,
                                       second_user_id: @match_id,
                                       status: "initiated"
                                       )
      @relationship.save
      flash[:alert] = "We'll let this user know you want to pair."
    end

    redirect_to relationships_path
  end

  def destroy
    @relationship = Relationship.new(action_user_id: current_user.id,
                                     second_user_id: params[:relationship][:match_id],
                                     status: "enemies")
    if @relationship.save
      flash[:alert] = "You will never pair with this person."
      redirect_to relationships_path
    end
  end

  private

  def check_this_relationship_exists_and_update(match_id)
    @relationship = relationship_exists?(match_id)
    if @relationship && @relationship.status == "initiated"
      @relationship.update(status: "friends")
      other_user = User.find(match_id)
      flash[:alert] = "Congrats #{current_user.name}, you and #{other_user.name} are a good match!"
    end
  end

  def relationship_exists?(match_id)
    Relationship.find_by(action_user_id: match_id,
                         second_user_id: current_user.id)
  end

  def exclusions
    Relationship.excluded_matches(current_user)
  end

  def best_matches
    User.find(Relationship.where(second_user_id: current_user.id, status: "initiated").pluck(:action_user_id)).sample(1).first
  end

  def second_best_matches
    second_best_matches = User.all_except(exclusions).where.not(id: current_user.id).sample(1).first
  end
end
