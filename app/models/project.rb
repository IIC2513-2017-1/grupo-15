class Project < ApplicationRecord
	validates :title, presence: true, allow_blank: false
	has_many :comments
end
