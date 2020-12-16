class UsersController < ApplicationController

    get '/users/signup' do
        erb :"users/signup"
    end

    get '/users/login' do
        erb :"users/login"
    end

end