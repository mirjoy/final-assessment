require "rails_helper"

RSpec.describe "unauthenticated user visits home page", type: :feature do
  before(:each) do
    user_logs_in_with_github
  end

end
