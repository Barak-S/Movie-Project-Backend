class FollowsController < ApplicationController

    def index
        follows=Follow.all
        render json: follows, except:[:created_at, :updated_at]
    end

    def create 
        follow = Follow.find_or_create_by(follow_params)
        render json: follow.to_json(:include => {
            :followee => {:only => [:username]}
          }, :except => [:created_at, :updated_at])
    end

    def show
        follow=Follow.find(params[:id])
        followee = User.find(follow.followee_id)
        render json: followee.to_json(:include => {
          :movies => {:only => [:Title, :Poster, :imdbRating, :imdbID, :Plot]}
        }, :except => [:created_at, :updated_at])
    end

    def find_my_followees
        follower = User.find_by(id: params[:follower_id])
        my_followees = Follow.where(follower_id: follower)
        info_i_need = my_followees.map{|f| f.followee}
        render json: info_i_need.to_json(:include => {
            :movies => {:only => [:Title, :Poster, :imdbRating, :imdbID, :Plot]}
          }, :except => [:created_at, :updated_at])
    end

    def remove_friend
        follow = Follow.find_by(follower_id: params[:follower_id], followee_id: params[:followee_id])
        follow.destroy
        find_my_followees()
    end

    private

    def follow_params
        params.require(:follow).permit(:follower_id, :followee_id)
    end

end