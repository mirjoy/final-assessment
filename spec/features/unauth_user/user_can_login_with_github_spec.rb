require 'rails_helper'

RSpec.describe "user logins with github the first time" do
  it "they are asked to fill out a profile" do
    lang = Language.create(name: "JavaScript")
    user_logs_in_with_github

    expect(page).to have_content("Choose all of your preferred languages")
    expect(page).to have_content("JavaScript")
    expect(page).to have_content("Share a little about yourself in 500 characters or less.")
    find(:css, '#checkboxes').set(true)
    fill_in("user[description]", with: "I like computers")
    click_link_or_button("Submit")
    expect(page).to have_content("Matches")
  end

  it "can't fill in more than 500 words in the description" do
    user_logs_in_with_github
    long_string = (1..500).to_a.join

    fill_in("user[description]", with: long_string)
    click_link_or_button("Submit")

    expect(page).to have_content("Please use 500 words or fewer.")
  end
end
