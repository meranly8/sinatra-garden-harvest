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
        crop = current_user.crops.build(params[:crop])
        if crop.save
            redirect "/users/#{current_user.id}"
        else
            @errors = crop.errors.full_messages.to_sentence
            erb :"crops/new"
        end
    end

    get '/crops/:id' do
        set_crop
        redirect_if_not_logged_in
        erb :"crops/show"
    end

    get '/crops/:id/edit' do
        set_crop
        redirect_if_not_logged_in
        if authorized_for?(@crop)
            erb :"crops/edit"
        else
            redirect "/users/#{current_user.id}"
        end 
    end

    patch '/crops/:id' do
        set_crop
        redirect_if_not_logged_in
        @crop.assign_attributes(params[:crop])
        if authorized_for?(@crop)
            if @crop.save
                redirect "/crops/#{@crop.id}"
            else
                @errors = @crop.errors.full_messages.to_sentence
                erb :"crops/edit"
            end
        else
            redirect "/users/#{current_user.id}"
        end
    end

    delete '/crops/:id' do
        set_crop
        redirect_if_not_logged_in
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