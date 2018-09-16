require 'rails_helper'

describe 'logged in user' do
  before(:each) do
    @user = create(:user)
    @song1 = create(:song, user_id: @user.id)
    @song2 = create(:song, user_id: @user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'can upload and  create a song' do

    visit song_path(@song1)

    Capybara.ignore_hidden_elements = false

    expect(Song.all.count).to eq(2)

    song3 = attach_file('song_audio', "#{Rails.root}/spec/features/test_uploads/beep_it.mp3", visible: false)
      click_button 'Add Song'

    expect(Song.all.count).to eq(3)
  end
end
