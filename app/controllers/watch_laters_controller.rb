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

    def find_and_delete
        movie = Movie.find_by(imdbID: params[:movie][:imdbID])
        user = User.find(params[:user_id])
        watch_later = WatchLater.find_by(movie_id: movie.id, user_id: user.id)
        watch_later.delete
        render json: user.movies, except:[:created_at, :updated_at]
    end


    private

    def watch_later_params
        params.require(:watch_later).permit(:id, :user_id, :movie_id)
    end



end