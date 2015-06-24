require "rails_helper"

RSpec.describe "unauthenticated user visits home page", type: :feature do
  it "can see the page" do
    visit root_path
    expect(page).to have_content("Find Your Pair")
  end

  it "cannot visit pairs page" do
    visit relationships_path
    expect(page).to have_content("Please sign in if you want to visit this page.")
    expect(current_path).to eq(root_path)
  end
end
