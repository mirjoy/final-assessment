require "rails_helper"

RSpec.describe "authenticated user visits match page", type: :feature do
  before(:each) do
    @user = user_logs_in_with_github
  end

  it "can see a match" do
    lang = Language.create(name: "Javascript")
    user2 = User.create(name: "richard", uid: "123")
    UserLanguage.create(user_id: user2.id, language_id: lang.id)

    visit user_path(@user.id)
    click_link_or_button("Find Pairs")

    expect(page).to have_content(user2.name)
    expect(page).to have_content(lang.name)
  end

  it "is notified if they don't have any matches" do
    visit user_path(@user.id)
    click_link_or_button("Find Pairs")

    expect(page).to have_content("You have no pending matches at this time.")
  end

  it "can start approving a match if the other user already hasn't done anything" do
    user2 = User.create(name: "richard", uid: "123")

    visit relationships_path
    expect(page).to have_content(user2.name)

    click_link_or_button("Accept Match")
    expect(page).to have_content("We'll let this user know you want to pair.")

    visit user_path(@user.id)
    expect(page).not_to have_content(user2.name)
  end

  it "can approve a match if the other user already has approved" do
    user2 = User.create(name: "richard", uid: "123")
    Relationship.create(action_user_id: user2.id, second_user_id: @user.id, status: "initiated")

    visit relationships_path
    expect(page).to have_content(user2.name)

    click_link_or_button("Accept Match")
    expect(page).to have_content("You have a new match!")

    visit user_path(@user.id)
    expect(page).to have_content(user2.name)
  end

  it "won't see a user if they've rejected the match" do
    user2 = User.create(name: "richard", uid: "123")
    Relationship.create(action_user_id: user2.id, second_user_id: @user.id, status: "enemies")

    visit relationships_path
    expect(page).to have_content("You have no pending matches at this time.")
  end

  it "can reject a match" do

  end
# When viewing the Dashboard, I should see a shiny button inviting me to "Find Pairs".
# Clicking this should take me to a new screen, where I will be shown potential pairs, and invited to match with them or not.

# For this iteration, let's not worry about how we're recommending matches. Simply show profile information about the first other user whom I have not already been matched with.

# When suggesting a match, the application should display:

# User's github name
# User's github profile pic
# User's list of desired languages
# User's description
# Below the other user's information, I should have 2 options:

# Approve match
# Reject match
# If I Approve a match (button on the right):

# Information should be stored on the server indicating that I am interested in pairing with that user.
# That user should disappear and I should be shown another user account.
# That user should not appear in my recommendations again.
# If I Reject a match (button on the left):

# Information should be stored on the server indicating that I am NOT interested in pairing with that user.
# That user should disappear and I should be shown another user account.
# That user should not appear in my recommendations again.
end
