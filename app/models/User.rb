class User < ApplicationRecord
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users

    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users


    has_many :watch_laters
    has_many :movies, through: :watch_laters

    def watch_later
        self.watch_laters.map { |e| e.movies }
    end
    
end