class ProjectMailer < ApplicationMailer
  def new_project_email(to_user, from_user)
    @to_user = to_user
    @from_user = from_user
    mail subject: "Fundup - New activity from #{from_user.name}", to: to_user.email
  end
end