require "rails_helper"

RSpec.describe "User creating trip", type: :feature do
  # before do
  #   request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:uber]
  # end

  xit "can log in and can create trip" do
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

  xit 'has a first and last name' do
    VCR.use_cassette('create_trip_get_lat_longs') do
      visit root_path
      mock_auth_hash
      click_link "Log in with UBER"
      fill_in 'enter your destination', :with => '1510 Blake St Denver CO'
      click_button "Go"
      expect(current_user.first_name).to eq 'Bob'
      expect(current_user.last_name).to eq 'Roberts'
    end
  end

  xit 'has an email' do
    VCR.use_cassette('create_trip_get_lat_longs') do
      visit root_path
      mock_auth_hash
      click_link "Log in with UBER"
      fill_in 'enter your destination', :with => '1510 Blake St Denver CO'
      click_button "Go"
      expect(current_user.email).to eq 'bob@roberts.com'
    end
  end

  xit 'has a picture' do
    VCR.use_cassette('create_trip_get_lat_longs') do
      visit root_path
      mock_auth_hash
      click_link "Log in with UBER"
      fill_in 'enter your destination', :with => '1510 Blake St Denver CO'
      click_button "Go"

      expect(current_user.picture_url).to eq 'https://d297l2q4lq2ras.cloudfront.net/nomad/2014/10/9/21/480x480_id_95dd3b12-ccbb-41e9-838e-ed94b77bb7a4.jpeg'
    end
  end

  xit 'has account without picture' do
    # need to sign up for uber without uploading profile picture (find out url for default pic
  end
end
