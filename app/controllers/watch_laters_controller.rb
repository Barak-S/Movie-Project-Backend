class WatchLatersController < ApplicationController

    def index
        watch_laters=WatchLater.all
        render json: watch_laters, except:[:created_at, :updated_at]
    end

    def create 
        watch_later = WatchLater.find_or_create_by(watch_later_params)
        render json: watch_later, except: [:created_at, :updated_at]
    end

    def show
        watch_later = WatchLater.find(params[:id])
        render json: watch_later.to_json(:include => {
          :movie => {:only => [:id, :Title, :Poster, :imdbRating, :Plot, :imdbID]}
        }, :except => [:created_at, :updated_at])

    end

    def destroy
        watch_later = WatchLater.find(params[:id])
        watch_later.destroy
    end


    private

    def watch_later_params
        params.require(:watch_later).permit(:user_id, :movie_id)
    end



end