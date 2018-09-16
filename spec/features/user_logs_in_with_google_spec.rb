require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth2" do
    stub_omniauth
    visit root_path

    expect(page).to have_link("Sign in with Google")
    expect(page).to_not have_content("Logout")

    click_link "Sign in with Google"

    expect(current_path).to eq(new_song_path)
    expect(page).to have_content("Start by Adding a Song!")
    expect(page).to have_link("Logout")
  end
end
