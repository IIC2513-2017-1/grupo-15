class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :reward

  def self.reward_amount
    reward.amount ? reward.amount : 0
  end
end
