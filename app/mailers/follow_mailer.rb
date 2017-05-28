class FollowMailer < ApplicationMailer
  def new_follower_email(user, follower)
    @user = user
    @follower = follower
    mail subject: "Fundup - New follower: #{follower.name}", to: user.email
  end
  def new_project_update_email(to_user, from_user)
    @to_user = to_user
    @from_user = from_user
    mail subject: "Fundup - New activity from #{from_user.name}", to: to_user.email
  end
end