class AddTwitterAccountToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :twitter_account, :string
  end
end
