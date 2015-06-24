require "rails_helper"

RSpec.describe "authenticated user visits match page", type: :feature do
  before(:each) do
    @user = user_logs_in_with_github
  end

  it "can see a match" do
    lang = Language.create(name: "Javascript")
    user2 = User.create(name: "richard", uid: "123")
    UserLanguage.create(user_id: user2.id, language_id: lang.id)

    visit user_path(@user)
    click_link_or_button("Find Pairs")
    expect(page).to have_content(user2.name)
    expect(page).to have_content(lang)
  end

  xit "is notified if they don't have any matches" do
  end

  xit "can approve a match" do

  end

  xit "can reject a match" do

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
