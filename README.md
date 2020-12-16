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