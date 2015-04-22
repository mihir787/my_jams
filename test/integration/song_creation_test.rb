require 'test_helper'

class SongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can create a song" do
    visit new_song_path
    fill_in "song[title]", with: "My song"
    fill_in "song[artist]", with: "An artist"
    click_link_or_button "Create Song"
    assert page.has_content?("My song")
    assert page.has_content?("An artist")
  end


end
