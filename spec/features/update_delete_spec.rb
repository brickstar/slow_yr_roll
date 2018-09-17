require 'rails_helper'

describe 'logged in user' do
  before(:each) do
    @user = create(:user)
    @song1 = create(:song, user_id: @user.id)
    @song2 = create(:song, user_id: @user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'can delete a song' do
    visit song_path(@song1)

    expect(@user.songs.count).to eq(2)

    within("#song-#{@song1.id}") do
      click_on('delete')
    end

    expect(page).to have_content("#{@song1.title} was successfully deleted!")
    expect(@user.songs.count).to eq(1)
  end

  xit 'can update a song title' do
    visit song_path(@song1)

    click_on("update")

    within("#song-#{@song1.id}") do
      fill_in "song[title]", with: "new title"
    end

    click_button "Update"

    expect(current_path).to eq(song_path(@song1))
    expect(page).to have_content("new title")
    expect(page).to_not have_content("#{@song1.title}")
  end

  xit "a user can not leave edit form empty" do
    visit song_path(@song1)

    within("#song-#{@song1.id}") do
      fill_in "song[title]", with: ""
    end

    click_button "Update"

    expect(current_path).to eq(song_path(@song1))
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("#{@song1.title}")
  end
end
