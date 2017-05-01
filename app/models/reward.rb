class Reward < ApplicationRecord
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
