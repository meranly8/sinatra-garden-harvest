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
        if params[:crop].values.any? {|value| value.blank?}
            redirect '/crops/new'
        else
            @crop = Crop.create(params[:crop])
            redirect "/crops/#{@crop.id}"
        end
    end
end