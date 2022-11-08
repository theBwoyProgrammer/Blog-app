require 'rails_helper'

RSpec.describe 'Posts', type: :features do
  feature 'show page' do
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

    before(:each) do
      @user = User.create(
        name: 'test',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'test',
        posts_counter: 0
      )
      @post1 = Post.create(
        author_id: @user.id,
        title: 'test',
        text: 'test test test test',
        comments_counter: 0,
        likes_counter: 0
      )
      Comment.create(author_id: @user, post: @post1, text: 'test test test test')
      @user = User.all
      visit user_post_path(@user.ids, @post1.id)
    end

    it 'I can see the post title ' do
      expect(page).to have_content(@post1.title)
    end

    it 'should see who wrote the post' do
      @user.each do |user|
        expect(user.name).to have_content('test')
      end
    end

    it 'should see the number of comments a post has' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'should see the username of each commentor.' do
      comments = @post1.comments
      comments.each do |comment|
        expect(comment.author_id).to have_content(comment.user.name)
      end
    end

    it 'should see the comment each commentor left.' do
      comments = @post1.comments
      comments.each do |comment|
        expect(comment.text).to have_content(comment.text)
      end
    end
  end
end
