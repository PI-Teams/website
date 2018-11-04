# IC-MN Website

This is a code copy of my website running on my ic-mn.herokuapp.com

I am still testing some programming techniques. 
So the code is not for production yet but Work in Progress

For this version I am using:

ruby "2.4.0"
gem 'rails', '~> 5.0.1'

Databases are 
- 'Postgres' for backend 
- 'Redis: for testing the live chat capabilities of ActionCable on the blog Pages (Yes, I know. Live chats for blogs are not a good idea because of spamming or hate posts. As I said. I am still testing technologies :)

Included are as well
- the sortable.js library as frontend drag and drop interface 
- the typed.js library for shortened javascript code

### Features

- Real Time chat engine for comments
- Blog
- Team
- Drag and drop interface for sorting team members on the website

If you want to test the site as well

First clone it and then run it in the terminal

git clone git@github.com:Schwengsbier/website.git

bundle install

rails db:migrate

rails s















