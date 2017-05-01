class Project < ApplicationRecord
	validates :name, presence: true, uniqueness: true, allow_blank: false
	validates :start_date, presence: true, allow_blank: false
	validates :end_date, presence: true, allow_blank: false
	validate :end_date_after_start_date?

	has_many :comments
	has_many :pledges
	has_many :rewards
	has_many :updates
	belongs_to :category
	belongs_to :user

	# Reference:
	# http://stackoverflow.com/questions/33639833/validate-that-an-end-date-is-later-than-a-start-date-in-rails-4
	def end_date_after_start_date?
		if end_date < start_date
			errors.add :end_date, "must be after start date"
		end
	end

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
