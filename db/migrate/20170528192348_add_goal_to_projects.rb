class AddGoalToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :goal, :float
  end
end
