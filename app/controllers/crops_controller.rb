class CropsController < ApplicationController
    get '/crops' do
        @crops = Crop.all
        erb :"crops/index"
    end

    get '/crops/:id' do
        @crop = Crop.find_by(id: params[:id])
        erb :"crops/show"
    end
end