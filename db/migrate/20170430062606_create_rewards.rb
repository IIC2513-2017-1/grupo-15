class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.string :title
      t.float :amount
      t.text :description

      t.timestamps
    end
    add_reference :rewards, :project, foreign_key: true
  end
end
