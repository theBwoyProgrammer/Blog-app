require 'rails_helper'

RSpec.describe 'Posts', type: :features do
  feature 'should' do
    before(:each) do
      @user = User.create(
        name: 'test',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'test',
        posts_counter: 0
      )
      @post1 = Post.create(
        id: rand(1000),
        author_id: @user,
        title: 'test',
        text: 'test',
        comments_counter: 0,
        likes_counter: 0
      )
      Comment.create(author_id: @user, post: @post1, text: 'This is my first comment')
      @user = User.all
      visit user_posts_path(@user.ids)
    end

    it 'should see the username of all other users' do
      @user.each do |user|
        expect(user.name).to have_content('test')
      end
    end

    it 'should see photo for each user' do
      @user.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'should see the number of posts each user has written' do
      expect(page).to have_content(@user.first.posts_counter)
    end

    it "have post's title." do
      expect(page).to have_content(@post1.title)
    end

    it "I can see some of the post's body." do
      expect(page).to have_content(@post1.text)
    end

    it 'I can see the first comments on a post' do
      expect(page).to have_content(@post1.comments.first)
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content(@post1.likes_counter)
    end
  end
end
