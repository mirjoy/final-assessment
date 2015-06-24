class Relationship < ActiveRecord::Base
  scope :excluded_matches, -> (user) { Relationship.where("action_user_id = ? or status = ? or status = ?",
                                                    user.id, "friends", "enemies")
                                                   .pluck(:action_user_id, :second_user_id).flatten.uniq }
  scope :potential_matches, -> (user) { Relationship.where("action_user_id = ? or second_user_id = ?", user.id, user.id)
                                                     .where(status: "friends").pluck(:action_user_id, :second_user_id)
                                                     .flatten - [user.id]}
  scope :all_except, -> (user) { where.not(id: user) }
end
