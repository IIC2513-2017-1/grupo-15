class Reward < ApplicationRecord
  validates :title, presence:true, allow_blank: false
  validates :amount, presence:true, allow_blank: false, numericality: { greater_than_or_equal_to: 0.01 }

  belongs_to :project
  has_many :pledges

  def self.search(search)
    if search
      where(project_id: search)
    else
      return []
    end
  end

end
