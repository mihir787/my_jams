require 'rails_helper'

RSpec.describe 'User login' do
  context 'with valid credentials' do
    it 'routes to user dashboard' do
      User.create(first_name: 'Bob', last_name: 'Loblaw', username: 'bob787',
        password: 'bob1', password_confirmation: 'bob1')
      visit login_path
      fill_in "session[username]", with: 'bob787'
      fill_in "session[password]", with: 'bob1'
      click_button 'Login'

      expect(page).to have_content('Welcome Bob!')
    end
  end
end
