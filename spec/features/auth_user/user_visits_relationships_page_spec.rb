require "rails_helper"

RSpec.describe "authenticated user visits match page", type: :feature do
  let!(:user) { user_logs_in_with_github }
  let(:other_user) { User.create(name: "richard", uid: "123") }

  xit "can see a match" do
    visit user_path(user)
    click_link_or_button("Find Pairs")

    expect(page).to have_content(other_user.name)
    expect(page).to have_content(lang.name)
  end

  xit "is notified if they don't have any matches" do
    visit user_path(user)
    click_link_or_button("Find Pairs")

    expect(page).to have_content("You have no pending matches at this time.")
  end

  xit "can start approving a match if the other user already hasn't done anything" do
    visit relationships_path
    expect(page).to have_content(other_user.name)

    click_link_or_button("Accept Match")
    expect(page).to have_content("We'll let this user know you want to pair.")

    visit user_path(user)
    expect(page).not_to have_content(other_user.name)
  end

  it "can approve a match if the other user already has approved" do
    Relationship.create(action_user_id: other_user.id, second_user_id: user.id, status: "initiated")

    visit relationships_path
    expect(page).to have_content(other_user.name)

    click_link_or_button("Accept Match")
    expect(page).to have_content("Congrats!")

    visit user_path(user.id)
    expect(page).to have_content(other_user.name)
  end

  it "won't see a user if they've rejected the match" do
    Relationship.create(action_user_id: other_user.id, second_user_id: user.id, status: "enemies")

    visit relationships_path
    expect(page).to have_content("You have no pending matches at this time.")
  end

  it "can reject a match" do
    Relationship.create(action_user_id: other_user.id, second_user_id: user.id, status: "intiated")

    visit relationships_path
    click_link_or_button("Reject Match")
    expect(page).to have_content("You will never pair with this person.")
    expect(page).to have_content("You have no pending matches at this time.")

  end
end
