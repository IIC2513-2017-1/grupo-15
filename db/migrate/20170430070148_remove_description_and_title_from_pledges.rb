class RemoveDescriptionAndTitleFromPledges < ActiveRecord::Migration[5.0]
  def change
    remove_column :pledges, :description
    remove_column :pledges, :title
    add_reference :pledges, :reward, foreign_key: true
  end
end
