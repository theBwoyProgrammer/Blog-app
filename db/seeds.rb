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
# first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
# second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

# first_post = Post.create(user: first_user, title: 'First', text: 'This is my first post')
# second_post = Post.create(user: second_user, title: 'Second', text: 'This is my second post')
# third_post = Post.create(user: first_user, title: 'Third', text: 'This is my third post')
# fourth_post = Post.create(user: second_user, title: ' Fourth', text: 'This is my fourth post')