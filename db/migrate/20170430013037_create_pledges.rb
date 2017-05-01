class CreatePledges < ActiveRecord::Migration[5.0]
  def change
    create_table :pledges do |t|
      t.string :title, null: false
      t.decimal :amount, null: false
      t.string :description, null: false

      t.timestamps
    end
      add_reference :pledges, :project, foreign_key: true
      add_reference :pledges, :user, foreign_key: true
  end
end
