require 'rails_helper'

describe 'user logs in' do
  context 'should land on first song' do
    xit 'should see links to all songs by title' do
      user = create(:user)
      # sign in with google
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)
      # user should land on Song.first/show
      expect(current_path).to eq(songs_path)
      # it should have an embedded player with/play/pause ff/rw and playback rate controls for this song
      # it should have links by title for all songs associated with current user
      # if i click a link to another song i should land on that songs show and embedded player now functions for this song
    end
  end
end
