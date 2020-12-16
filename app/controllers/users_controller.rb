class UsersController < ApplicationController

    get '/users/signup' do
        erb :"users/signup"
    end

    post '/users' do
        if params[:user][:username] != "" && params[:user][:email] != "" && params[:user][:password]  != "" 
            @user = User.create(params[:user])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
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
            redirect "/users/#{@user.id}"

        #else
            #tell user the login error
            #redirect back to 'user/login'
        end
    end

    get '/users/logout' do
        session.clear
        redirect '/users/login'
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        @user_crops = @user.crops
        erb :"users/show"
    end

end 