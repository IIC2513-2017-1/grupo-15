class User < ApplicationRecord
	validates :name, presence:true, uniqueness: true, allow_blank: false
	validates :password, presence:true, length: { in 6..20 },
						 confirmation: true
	validates :email, presence: true, uniqueness: true, allow_blank: false, 
					  format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i 

	has_many :comments
	has_many :projects
end
