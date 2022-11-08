# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# rails generate migration CreateUsers name:string photo:text bio:text posts_counter:integer
# rails g migration CreatePosts title:string text:text comment_counter:integer likes_counter:integer 
# rails g migration CreateComments text:text
# rails g migration CreateLikes
# rails g migration AddUserRefToPosts user:references:index
# rails g migration AddUserRefToComments user:references:index
# rails g migration AddUserRefToLikes user:references:index
# rails g migration AddPostRefToComments post:references:index
# rails g migration AddPostRefToLikes post:references:index
# rails db:migrate
first_user = User.create(name: 'Hatim', photo: 'https://store-images.s-microsoft.com/image/apps.14401.14335195431380456.948477b0-a258-496a-9152-d98ea44e9f2b.06535fad-ae0d-4d70-bc11-d43c315696cc?mode=scale&q=90&h=300&w=300', bio: 'Software developer.')
second_user = User.create(name: 'Lilly', photo: 'https://media.cdnandroid.com/item_images/31758/imagen-talking-tom-cat-2-0thumb.jpeg', bio: 'Teacher from Poland.')

# first_post = Post.create(author: second_user, title: 'first day as a developer', text: 'This is my first post')
# second_post = Post.create(author: second_user, title: 'Second day', text: 'This is my second post')
# third_post = Post.create(author: second_user, title: 'Third', text: 'This is my third post')
# fourth_post = Post.create(author: second_user, title: ' Fourth', text: 'This is my fourth post')
# Comment.create(post_id: 12, author_id: 7, text: 'thanks!' )
# Comment.create(post_id: 13, author_id: 7, text: 'gretaaa!' )
# Comment.create(post_id: 14, author_id: 7, text: 'Are you done with your project!' )
# Comment.create(post_id: 15, author_id: 7, text: 'Is it approved yet?' )
# Comment.create(post_id: 16, author_id: 8, text: 'Are you available for a call?' )
# Comment.create(post_id: 17, author_id: 8, text: 'Are you enjoying ROR?' )
# Comment.create(post_id: 18, author_id: 8, text: 'The end!' )
# Comment.create(post_id: 19, author_id: 8, text: 'The endddddddddddd!' )
