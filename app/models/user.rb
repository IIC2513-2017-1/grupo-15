class User < ApplicationRecord
  has_secure_password


  validates :name, presence:true, uniqueness: true, allow_blank: false
  validates :password, length: { minimum: 6 }, allow_nil: true
  #validates :password, presence:true#, allow_blank: false, length: {minimum: 6} #confirmation: true
  #validates :password_confirmation, presence: true #comentado para poder utilizar seeds ya existentes

  #https://quickleft.com/blog/rails-tip-validating-users-with-has_secure_password/

  validates :email, presence: true, uniqueness: true, allow_blank: false,
					  format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "profile_placeholder.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :comments
  has_many :pledges
  has_many :projects

  has_many :follower_relationships, foreign_key: :following_id,
                                    class_name: 'Follow'
  has_many :following_relationships, foreign_key: :follower_id,
                                     class_name: 'Follow'

  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following, through: :following_relationships, source: :following

  def follows? (fr_id,fg_id )
    Follow.find_by(follower_id: fr_id, following_id: fg_id.to_i).nil?
  end
end
