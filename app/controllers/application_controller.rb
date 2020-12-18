require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "discover_weekly"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) 
      # memoization; less hits to db when saved as instance variable
    end

    def authorized_for?(crop)
      crop.user == current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/'
      end
    end
  end

end
