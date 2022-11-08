require 'rails_helper'

RSpec.describe 'Users', type: :features do
  feature 'show page' do
    before(:each) do
      @user = User.create(
        name: 'test',
        photo: 'https://store-images.s-microsoft.com/image/apps.14401.14335195431380456.948477b0-a258-496a-9152-d98ea44e9f2b.06535fad-ae0d-4d70-bc11-d43c315696cc?mode=scale&q=90&h=300&w=300',
        bio: 'test',
        posts_counter: 0
      )

      @post = Post.create(
        author_id: @user.id,
        title: 'test',
        text: 'test',
        comments_counter: 0,
        likes_counter: 0
      )
      @user = User.all
    end

    it 'should have photo' do
      visit user_path(@user.first)
      expect(page).to have_css("img[src*='#{@user.first.photo}']")
    end

    it 'should have name' do
      visit user_path(@user.first)
      expect(page).to have_content(@user.first.name)
    end

    it 'should have posts counter' do
      visit user_path(@user.first)
      expect(page).to have_content(@user.first.posts_counter)
    end

    it 'should have bio' do
      visit user_path(@user.first)
      expect(page).to have_content(@user.first.bio)
    end

    it 'should have recent 3 posts' do
      visit user_path(@user.first)
      recent_posts = @user.first.recent_posts
      recent_posts.each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text)
      end
    end

    it 'should have a button to see all posts' do
      visit user_path(@user.first)
      expect(page).to have_link('See all posts')
    end

    it 'should redirect to user\'s posts page when clicking on the button' do
      visit user_path(@user.first)
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user.first))
    end

    it 'should redirect to user\'s posts index page when clicking on \'See all posts\'' do
      visit user_path(@user.first)
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user.first))
    end
  end
end
