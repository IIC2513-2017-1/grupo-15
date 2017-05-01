class Follow < ApplicationRecord
  validate :follows_different_user?

  belongs_to :follower, foreign_key: 'follower_id', class_name: 'User'
  belongs_to :following, foreign_key: 'following_id', class_name: 'User'
  def follows_different_user?
		if follower_id == following_id
			errors.add :following_id, "Sorry, you can't follow yourself"
		end
	end
end
