class CropsController < ApplicationController
    get '/crops' do
        @crops = Crop.all
        erb :"crops/index"
    end

    get '/crops/new' do
        if logged_in?
            erb :"crops/new"
        else
            redirect '/users/login'
        end
    end

    get '/crops/:id' do
        @crop = Crop.find_by(id: params[:id])
        erb :"crops/show"
    end

    post '/crops' do
        binding.pry
    end
end