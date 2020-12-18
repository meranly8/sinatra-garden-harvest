class UsersController < ApplicationController

    get '/users/signup' do
        erb :"users/signup"
    end

    post '/users' do
        user = User.new(params[:user])
        if user.save
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            @errors = user.errors.full_messages.to_sentence
            erb :'users/signup'
        end
    end
    
    get '/users/login' do
        if !logged_in?
            erb :"users/login"
        else
            redirect "/users/#{session[:user_id]}"
        end
    end

    post '/users/login' do
        
        @user = User.find_by(email: params[:user][:email])
        
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"

        else
            
            redirect '/users/login'
        end
    end

    get '/users/logout' do
        session.clear
        redirect '/'
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        @user_crops = @user.crops
        erb :"users/show"
    end

end 