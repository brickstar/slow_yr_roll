require 'rails_helper'

describe 'user logs in' do
  context 'should land on first song' do
    it 'should see links to all songs by title' do
      user = create(:user)
      song1 = create(:song, user_id: user.id)
      song2 = create(:song, user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit song_path(song1)

      expect(page).to have_link(song1.title)
      expect(page).to have_link(song2.title)

      click_on "#{song2.title}"

      expect(current_path).to eq(song_path(song2))
      expect(page).to have_link(song1.title)
      expect(page).to have_link(song2.title)
    end
  end
end
