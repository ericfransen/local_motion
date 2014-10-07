require 'rails_helper'

describe 'map', type: :feature do

  it 'is displayed on index page' do
    visit '/index'
    expect(page).to have_css('div.show_map') 
  end
end
