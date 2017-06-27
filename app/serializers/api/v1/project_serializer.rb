class  Api::V1::ProjectSerializer < Api::V1::BaseSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :start_date, :end_date, :user_id, :category_id, :goal,
   :created_at, :updated_at
  has_many :rewards, include: :all
  has_many :comments, include: :all
  type :project
  link :self do
    href project_path(object)
  end
end