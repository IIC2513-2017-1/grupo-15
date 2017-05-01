class CreateUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :updates do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.datetime :date, null: false

      t.timestamps
    end
      add_reference :updates, :project, foreign_key: true
  end
end
