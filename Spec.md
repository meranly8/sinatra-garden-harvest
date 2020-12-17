Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
..* User, Crop

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
..* User has_many :crops
    
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
..* Crop belongs_to :user

- [ ] Include user accounts with unique login attribute (username or email)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
..* ~~get '/crops'~~
..* ~~get '/crops/new'~~
..* ~~get '/crops/:id'~~
..* ~~post '/crops'~~
..* ~~get '/crops/:id/edit'~~
..* ~~patch '/crops/:id'~~
..* ~~delete '/crops/:id'~~

- [x] Ensure that users can't modify content created by other users
..* #logged_in? logic on edit and delete buttons and #authorized_for? logic implemented in update and delete actions

- [x] Include user input validations
Prohibited from creating or updating user and crop entries with blank values

- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message