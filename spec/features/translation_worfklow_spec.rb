require "rails_helper"

describe "logged in user" do
  before(:each) do
    @user = create(:user)
    @song1 = create(:song, user_id: @user.id)
    @song2 = create(:song, user_id: @user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe "clicks on 'en espanol' button" do
    it "translates from english <> spanish" do

      visit song_path(@song1)

      expect(page).to have_link("traducir al español")

      click_on("traducir al español")

      expect(page).to_not have_link("traducir al español")
      expect(page).to have_link("translate to english")

      within (".playlist-box") do
        expect(page).to have_content("Canciones")
        expect(page).to_not have_content("Songs")
      end

      click_on("translate to english")

      within (".playlist-box") do
        expect(page).to have_content("Songs")
        expect(page).to_not have_content("Canciones")
      end
    end
  end
end
