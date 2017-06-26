json.projects do
  json.array! @projects do |project|
    json.id project.id
    json.href api_v1_project_url(project)
    json.description project.description
    json.owner project.user.name
  end
end
