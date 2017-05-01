class Category < ApplicationRecord
  validates :name, presence:true, uniqueness: true, allow_blank: false, length: {minimum: 2}
  has_many :projects
end
