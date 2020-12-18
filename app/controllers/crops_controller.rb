class CropsController < ApplicationController
    get '/crops' do
        @crops = Crop.all
        erb :"crops/index"
    end

    get '/crops/new' do
        redirect_if_not_logged_in
        erb :"crops/new"
    end

    post '/crops' do
        redirect_if_not_logged_in
        if params[:crop].values.any? {|value| value.blank?}
            redirect '/crops/new'
        else
            @crop = Crop.create(params[:crop])
            redirect "/users/#{current_user.id}"
        end
    end

    get '/crops/:id' do
        redirect_if_not_logged_in
        set_crop
        erb :"crops/show"
    end

    get '/crops/:id/edit' do
        redirect_if_not_logged_in
        set_crop
        if authorized_for?(@crop)
            erb :"crops/edit"
        else
            redirect "/users/#{current_user.id}"
        end 
    end

    patch '/crops/:id' do
        redirect_if_not_logged_in
        set_crop
        if authorized_for?(@crop)
            if params[:crop].values.any? {|value| value.blank?}
                redirect "/crops/#{current_user.id}/edit"
            else
                @crop.update(params[:crop])
                @crop.save
                redirect "/crops/#{@crop.id}"
            end
        else
            redirect "/users/#{current_user.id}"
        end
    end

    delete '/crops/:id' do
        set_crop
        if authorized_for?(@crop)
            @crop.destroy
            redirect "/users/#{current_user.id}"
        else
            redirect "/users/#{current_user.id}"
        end 
    end

    private #only to be used in this class

    def set_crop
        @crop = Crop.find_by(id: params[:id])
    end

end