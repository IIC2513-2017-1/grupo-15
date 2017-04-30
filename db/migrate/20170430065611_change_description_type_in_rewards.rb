class ChangeDescriptionTypeInRewards < ActiveRecord::Migration[5.0]
  def change
    def up
    change_column :rewards, :description, :text
  end

  def down
    change_column :rewards, :description, :string
  end
  end
end
