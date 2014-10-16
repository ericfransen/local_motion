require "rails_helper"

RSpec.describe "User creating trip", type: :feature do
  # before do
  #   request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:uber]
  # end

  describe "A user" do

    it "can log in and can create trip" do
      VCR.use_cassette('create_trip_get_lat_longs') do
        visit root_path
        mock_auth_hash
        click_link "Log in with UBER"
        click_link "Use My Location"
        fill_in 'enter your destination', :with => '1510 Blake St Denver CO'
        click_button "Go"
        expect(page).to have_content('Options')
      end
    end
  end
end
