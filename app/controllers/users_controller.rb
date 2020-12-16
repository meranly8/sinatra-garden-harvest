class UsersController < ApplicationController

    get '/users/signup' do
        erb :"users/signup"
    end

    get '/users/login' do
        erb :"users/login"
    end

    post '/users/login' do
        @user = User.find_by(email: params[:user][:email])
        
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect "/crops"
        end
    end

end