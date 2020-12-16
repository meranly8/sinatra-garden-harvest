class UsersController < ApplicationController

    get '/users/signup' do
        erb :"users/signup"
    end

    post '/users' do
        if params[:user][:username] != "" && params[:user][:email] != "" && params[:user][:password]  != "" 
            @user = User.create(params[:user])
            redirect '/crops'
        else
            redirect '/users/signup'
        end
    end
    
    get '/users/login' do
        erb :"users/login"
    end

    post '/users/login' do
        @user = User.find_by(email: params[:user][:email])
        
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect "/crops"

        #else
            #tell user the login error
            #redirect back to 'user/login'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :"users/show"
    end

    get '/users/logout' do
        session.clear
        redirect '/users/login'
    end
end 