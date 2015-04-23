require 'rails_helper'

RSpec.describe "User creates a song" do
  context 'with valid attributes' do
    it "saves and displays the song title" do
      visit new_user_path
      fill_in 'First name', with: "Bob"
      fill_in 'Last name', with: "Striker"
      fill_in 'Username', with: "Bob"
      fill_in 'Password', with: "password"
      fill_in 'Password confirmation', with: "password"

      click_link_or_button "Create User"

      expect(page).to have_content("Welcome Bob!")

      visit new_song_path
      fill_in "song[title]", with: "My song"
      fill_in "song[artist]", with: "An artist"
      click_link_or_button "Create Song"
      expect(page).to have_content('My song')
      expect(page).to have_content('An artist')
    end
  end
end
