require "rails_helper"

RSpec.describe "User visits root path of app" do
  it "sees the main page with app" do
      visit root_path
      
      expect(page).to have_content("Idea Box 2.0")
  end
end
