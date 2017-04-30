class Reward < ApplicationRecord
  belongs_to :project
  has_many :pledges
end
