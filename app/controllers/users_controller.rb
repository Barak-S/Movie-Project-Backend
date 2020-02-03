class UsersController < ApplicationController

    def index
        users=User.all
        render json: users, except:[:created_at, :updated_at]
    end

    def create 
        user = User.find_or_create_by(user_params)
        render json: user, except: [:created_at, :updated_at]
    end

    def show
        user = User.find(params[:id])
        render json: user.to_json(:include => {
          :watch_laters => {:only => [:user_id, :movie_id, :id]}
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
