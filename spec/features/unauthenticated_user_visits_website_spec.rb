require "rails_helper"

RSpec.describe "unauthenticated user visits home page", type: :feature do
  it "can see the page" do
    visit root_path
    expect(page).to have_content("Pairr")
  end
end
