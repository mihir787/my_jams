require 'rails_helper'

RSpec.describe 'User logout' do
  context "when previously logged in" do
    it 'logs out the user' do
      User.create(first_name: 'Bob', last_name: 'Jones', username: 'bob1',
          password: 'bobrocks', password_confirmation: 'bobrocks' )
      visit login_path
      fill_in 'session[username]', with: 'bob1'
      fill_in 'session[password]', with: 'bobrocks'
      click_button 'Login'

      expect(page).to have_content("Welcome Bob!")

      click_link_or_button 'Logout'

      expect(page).to have_content("Successfully logged out.")
    end
  end
end
