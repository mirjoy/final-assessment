require "rails_helper"

RSpec.describe "unauthenticated user visits home page", type: :feature do
  it "can see the page" do
    visit root_path
    expect(page).to have_content("Find Your Pair")
    expect(page).to have_content("Create An Account")
  end

  it "cannot visit pairs page" do
    visit pairs_path
    expect(page).to have_content("Please sign in if you want to visit this page.")
    expect(current_path).to eq(root_path)
  end
end
