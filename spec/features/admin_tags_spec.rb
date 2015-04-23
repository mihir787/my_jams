require "rails_helper"

RSpec.describe 'admin tags' do
  context 'with admin logged in' do

    let(:admin) do
      User.create(first_name: "Admin", last_name: "Admin", username: "admin", password: "password", role: 1)
    end

    it 'displays tag listing page' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_tags_path
      expect(page).to have_content("Tags Listing")
    end

  end

  context 'when non admin is logged in' do

    let(:default_user) do
      User.create(first_name: "Al", last_name: "Ill", username: "alisill", password: "password")
    end

    it 'displays tag listing page' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)
      visit admin_tags_path
      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end
  end

end
