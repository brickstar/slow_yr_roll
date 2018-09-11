require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth2" do
    stub_omniauth
    visit root_path

    expect(page).to have_link("Sign in with Google")
    expect(page).to_not have_content("Logout")

    click_link "Sign in with Google"

    expect(current_path).to eq(songs_path)
    expect(page).to have_content("Matt Bricker")
    expect(page).to have_link("Logout")
  end
end
