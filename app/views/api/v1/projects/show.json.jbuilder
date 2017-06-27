json.project do
  json.id @project.id
  json.name @project.name
  json.href api_v1_project_url(@project)
  json.description @project.description
  json.category @project.category.name
  json.goal @project.goal
  json.user do
    json.id @project.user.id
    #json.href api_v1_user_url(@project.user)
    json.email @project.user.email
    json.first_name @project.user.name
  end
end
