class CreateUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :updates do |t|
      t.string :title
      t.string :description
      t.datetime :date

      t.timestamps
    end
      add_reference :updates, :project, foreign_key: true
  end
end
