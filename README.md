# ABOUT

# INSTALLATION
In terminal, clone the code.
```ruby
git clone git@github.com:meranly8/sinatra-garden-harvest.git
```

# USAGE

# SUPPORT
If an issue arises, please open an issue and assign it to meranly8

[Open New Issue for sinatra-garden-harvest](https://github.com/meranly8/sinatra-garden-harvest/issues/new)

# CONTRIBUTION
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

# LICENSE
[MIT License](https://choosealicense.com/licenses/mit/)
Copyright (c) [2020] [Michelle Ranly]


Building app to track user's crops harvested in their gardens
users should be able to signup, login, logout, create crops, edit and delete only crops created by user, view all crops
# DB & MODELS
## ~~create migrations~~
    crops: name, quantity, year, season, user_id, date_created, date_udpated
    users: username, email, password_digest
## ~~create models~~
    crops: belongs_to user
    user: has_many crops; has_secure_password

# CONTROLLERS
## CropsController
CRUD Actions
- ~~GET index~~
- ~~GET show~~
- GET new
- POST create
- GET edit
- PATCH update
- DELETE delete

## UsersController
- GET signup (new)
- POST users (create)
- GET login 
- POST login
- GET show
- GET logout

# VIEWS
Only for GET actions
## Crops
- index
- show
- new
- edit

## Users
- ~~signup~~
- ~~login~~
- show