class  Api::V1::CommentSerializer < Api::V1::BaseSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :content, :created_at, :updated_at, :user_id, :project_id
  type :comment
 
end