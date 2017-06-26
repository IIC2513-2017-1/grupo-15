class  Api::V1::RewardSerializer < Api::V1::BaseSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :amount, :description, :created_at, :updated_at,:project_id
  type :reward
 
end