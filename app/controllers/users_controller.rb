class UsersController < ApplicationController

    get '/users/signup' do
        erb :"users/signup"
    end

    post '/users' do
        if params[:user].values.any? {|value| value.blank?}
            redirect '/users/signup'
        else
            @user = User.create(params[:user])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
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
        redirect '/'
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        @user_crops = @user.crops
        erb :"users/show"
    end

end 