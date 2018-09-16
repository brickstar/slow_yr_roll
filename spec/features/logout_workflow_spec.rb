require 'rails_helper'

describe 'user' do
  it 'can logout from root page' do
    user = create(:user)
    song = create(:song, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_on 'Logout'

    expect(current_path).to eq(root_path)

    within('nav') do
      expect(page).to have_content('Signed out!')
    end
  end

  it 'can logout from songs page' do
    user = create(:user)
    song = create(:song, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit song_path(song)

    click_on 'Logout'

    expect(current_path).to eq(root_path)

    within('nav') do
      expect(page).to have_content('Signed out!')
    end
  end
end
