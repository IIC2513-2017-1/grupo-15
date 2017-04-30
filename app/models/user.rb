class User < ApplicationRecord
	has_many :comments
	has_many :pledges
	has_many :projects
end
