class User < ApplicationRecord
	validates :name, presence:true, uniqueness: true, allow_blank: false
	validates :password, presence:true, length: {minimum: 6}, confirmation: true
	#validates :password_confirmation, presence: true #comentado para poder utilizar seeds ya existentes
	validates :email, presence: true, uniqueness: true, allow_blank: false,
					  format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i 

	has_many :comments
	has_many :pledges
	has_many :projects
end
