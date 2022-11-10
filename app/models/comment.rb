class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comments_counter
  before_destroy :update_comments_down

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def update_comments_down
    post.update_columns('comments_counter' => post.comments_counter - 1)
  end
end
