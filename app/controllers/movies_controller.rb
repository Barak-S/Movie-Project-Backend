class MoviesController < ApplicationController

    def index
        movies=Movie.all
        render json: movies, except:[:created_at, :updated_at]
    end

    def create 
        movie = Movie.find_or_create_by(movie_params)
        render json: movie, except: [:created_at, :updated_at]
    end

    def show
        movie=Movie.find(params[:id])
        render json: movie, except: [:created_at, :updated_at]
    end

    def destroy
        movie = Movie.find(params[:id])
        movie.destroy
    end


    private

    def movie_params
        params.require(:movie).permit(:Title, :Poster, :imdbRating, :Plot, :imdbID)
    end

end
