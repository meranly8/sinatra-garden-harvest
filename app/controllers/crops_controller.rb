class CropsController < ApplicationController
    get '/crops' do
        @crops = Crop.all
        erb :"crops/index"
    end

    get '/crops/new' do
        if logged_in?
            erb :"crops/new"
        else
            redirect '/'
        end
    end

    post '/crops' do
        if params[:crop].values.any? {|value| value.blank?}
            redirect '/crops/new'
        else
            @crop = Crop.create(params[:crop])
            redirect "/users/#{current_user.id}"
        end
    end

    get '/crops/:id' do
        set_crop
        erb :"crops/show"
    end

    get '/crops/:id/edit' do
        set_crop
        if logged_in?
            if @crop.user == current_user
                erb :"crops/edit"
            else
                redirect "/users/#{current_user.id}"
            end 
        else
            redirect '/'
        end
    end

    patch '/crops/:id' do
        set_crop
        
        if logged_in?
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
        else
            redirect "/"
        end
    end

    delete '/crops/:id' do
        set_crop
        if authorized_for?(@crop)
            @crop.delete
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