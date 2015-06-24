require 'rails_helper'

RSpec.describe "user logins with github the first time" do
  it "they are asked to fill out a profile" do
    Language.create(name: "JavaScript")
    user_logs_in_with_github

    expect(page).to have_content("Choose all of your preferred languages")
    expect(page).to have_content("JavaScript")
    expect(page).to have_content("Share a little about yourself in 500 characters or less.")
    fill_in("user[description]", with: "I like computers")
    click_link_or_button("Submit")
    expect(page).to have_content("Matches")
  end
end
