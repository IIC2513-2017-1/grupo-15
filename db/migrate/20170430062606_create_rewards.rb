class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.string :title, null: false
      t.float :amount, null: false
      t.text :description, null: false

      t.timestamps
    end
    add_reference :rewards, :project, foreign_key: true
  end
end
