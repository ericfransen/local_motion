require "rails_helper"

RSpec.describe "Log in with UBER", type: :feature do
  # before do
  #   request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:uber]
  # end

  describe "user with valid information" do
    it "is successful" do
      visit root_path
      expect(page).to have_content "Log in with UBER"
      mock_auth_hash
      click_link "Log in with UBER"
      expect(page).not_to have_content "Log in with UBER"
      expect(page).to have_content "You successfully signed in."
      expect(page).to have_content "Welcome" #name
    end
  end

  describe "user with invalid information" do
    it "has authentication errors" do
      auth_failure
      visit root_path
      click_link "Log in with UBER"
      expect(page).to have_content "Log in with UBER"
      expect(page).to have_content "UBER authentication failed."
    end
  end
end
