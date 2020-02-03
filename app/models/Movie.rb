class Movie < ApplicationRecord
    has_many :watch_laters
    has_many :users, through: :watch_laters

end
