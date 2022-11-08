require 'rails_helper'

RSpec.describe 'Posts', type: :features do
  feature 'should' do
    before(:each) do
      @post = Post.create(title: 'test', text: 'test', user_id: 1)
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
