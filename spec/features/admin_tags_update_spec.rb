require "rails_helper"

RSpec.describe 'admin tags update' do
  context 'with admin logged in' do

    let(:admin) do
      User.create(first_name: "Admin", last_name: "Admin", username: "admin", password: "password", role: 1)
    end

    it 'updates tag ' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_tag_path
      fill_in "Name", with: 'jazz'
      click_link_or_button 'Create Tag'
      expect(page).to have_content("jazz")
      click_link_or_button "update"
      fill_in "Name", with: 'max'
      click_link_or_button 'Update Tag'

      expect(page).to have_content("max")
    end
  end
end
