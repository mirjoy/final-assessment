class User < ActiveRecord::Base
  has_many :user_languages
  has_many :languages, through: :user_languages

  validates :uid, :name, presence: true
  validates :uid, uniqueness: true

  def self.find_or_create_by_auth(auth_data)
    user = find_or_create_by_uid(auth_data["uid"])
    user.name = auth_data["info"]["name"]
    user.image = auth_data["info"]["image"]
    user.email = auth_data["info"]["email"]
    user.github_account = auth_data["info"]["urls"]["GitHub"]
    user.save
    user
  end

  def self.find_or_create_by_uid(id)
    User.find_by(uid: id) || User.new(uid: id)
  end

  def self.all_except(current_user)
    where.not(id: current_user.id)
  end
end
