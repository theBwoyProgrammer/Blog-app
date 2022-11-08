require 'rails_helper'

RSpec.describe 'Users', type: :features do
  feature 'should' do
    before(:each) do
      @user = User.create(name: 'test', photo: nil, posts_counter: 0)
    end

    it 'have photo' do
      visit '/users'
      expect(page).to have_content(@user.photo)
    end

    it 'have name' do
      visit '/users'
      expect(page).to have_content(@user.name)
    end

    it 'have posts counter' do
      visit '/users'
      expect(page).to have_content(@user.posts_counter)
    end
  end
end
