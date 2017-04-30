class Project < ApplicationRecord
	has_many :comments
	has_many :pledges
	has_many :rewards
	has_many :updates
	belongs_to :category
	belongs_to :user

	def start
		self.start_date.strftime('%a, %d %b %Y %H:%M:%S')
	end

	def end
		self.end_date.strftime('%a, %d %b %Y %H:%M:%S')
	end

	def self.search(search)
		if search
			where(category_id: search)
		else
			all
		end
	end

end
