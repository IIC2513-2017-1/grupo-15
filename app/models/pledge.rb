class Pledge < ApplicationRecord
  validates :amount, numericality: { greater_than_or_equal_to: 1 },
            format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  belongs_to :user
  belongs_to :project
  belongs_to :reward

  def self.reward_amount
    reward.amount ? reward.amount : 0
  end
end
