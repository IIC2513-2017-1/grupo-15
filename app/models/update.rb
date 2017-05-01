class Update < ApplicationRecord
  validates :title, presence:true, allow_blank: false
  validates :date, presence:true, allow_blank: false

  belongs_to :project
end
