class Follow < ApplicationRecord
  validates :followee, uniqueness: true

  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'

end