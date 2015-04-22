require 'rails_helper'

RSpec.describe 'user account creation' do
  context 'with valid attributes' do
    it 'creates account' do
      visit new_user_path
      fill_in 'First name', with: "Bob"
      fill_in 'Last name', with: "Striker"
      fill_in 'Username', with: "Bob"
      fill_in 'Password', with: "password"
      fill_in 'Password confirmation', with: "password"
      click_link_or_button "Create User"

      expect(page).to have_content("Welcome Bob!")
    end
  end
end
