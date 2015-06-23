require 'rails_helper'

RSpec.describe "user logins with github" do
  it "is asked to enter language preferences and about the first time" do
    user_logs_in_with_github

    expect(page).to have_content("Choose all of your preferred languages")
    expect(page).to have_content("JavaScript")
    expect(page).to have_content("Share a little about yourself in 500 characters or less.")
  end
end
