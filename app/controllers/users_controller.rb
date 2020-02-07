class UsersController < ApplicationController

    def index
        users=User.all
        render json: users, except:[:created_at, :updated_at]
    end

    def create 
        user = User.create(user_params)
        render json: user, except: [:created_at, :updated_at]
    end

    def find_my_account
        user = User.find_by(user_params)
        render json: user, except: [:created_at, :updated_at]
    end

    def show
        user = User.find(params[:id])
        render json: user.to_json(:include => {
          :movies => {:only => [:Title, :Poster, :imdbRating, :imdbID, :Plot]}
        }, :except => [:created_at, :updated_at])
      end

    def destroy
        user = User.find(params[:id])
        user.destroy
    end


    private

    def user_params
        params.require(:user).permit(:id, :username, :password)
    end

end
