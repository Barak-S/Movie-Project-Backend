class FollowsController < ApplicationController

    def index
        follows=Follow.all
        render json: follows, except:[:created_at, :updated_at]
    end

    def create 
        follow = Follow.find_or_create_by(follow_params)
        render json: follow, except: [:created_at, :updated_at]
    end

    def show
        folow=Follow.find(params[:id])
        render json: follow, except: [:created_at, :updated_at]
    end

    def destroy
        follow = Follow.find(params[:id])
        follow.destroy
    end

    private

    def follow_params
        params.require(:follow).permit(:follower_id, :followee_id)
    end

end