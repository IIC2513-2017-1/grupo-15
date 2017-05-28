class FollowMailer < ApplicationMailer
  def new_follower_email(user, follower)
    @user = user
    @follower = follower
    mail subject: "New follower: #{follower.name}", to: user.email
  end
end