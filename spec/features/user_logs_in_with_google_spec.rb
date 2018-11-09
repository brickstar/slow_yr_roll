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

    click_on("Logout")

    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/songs/new'
    
    song3 = attach_file('song_audio', "#{Rails.root}/spec/features/test_uploads/beep_it.mp3", visible: false)

    fill_in 'song[title]', with: 'new title'

    click_button 'Add Song'

    expect(current_path).to eq('/songs/1')
  end
end
