require "rails_helper"

RSpec.describe "unauthenticated user visits home page", type: :feature do
  it "can see the page" do
    visit root_path
    expect(page).to have_content("Find Your Pair")
    expect(page).to have_content("Create An Account")

    click_link_or_button("Start Pairing")
    expect(current_path).to eq(new_session_path)
  end
end
