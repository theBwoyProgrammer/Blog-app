require 'rails_helper'

RSpec.describe 'Users', type: :features do
  feature 'should' do
    before(:each) do
      @user = User.create(name: 'test',
                          photo: 'https://store-images.s-microsoft.com/image/apps.14401.14335195431380456.948477b0-a258-496a-9152-d98ea44e9f2b.06535fad-ae0d-4d70-bc11-d43c315696cc?mode=scale&q=90&h=300&w=300', posts_counter: 0)
    end

    it 'have photo' do
      visit '/users'
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    it 'have name' do
      visit '/users'
      expect(page).to have_content(@user.name)
    end

    it 'have posts counter' do
      visit '/users'
      expect(page).to have_content(@user.posts_counter)
    end

    it 'should redirect to user\'s show page when clicking on a user' do
      visit '/users'
      click_link(@user.name)
      expect(page).to have_current_path(user_path(@user))
    end
  end
end
