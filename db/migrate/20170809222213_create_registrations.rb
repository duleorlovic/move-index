class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.references :user, foreign_key: true, null: false
      t.references :discipline, foreign_key: true, null: false
      t.integer :status
      t.string :tshirt_size

      t.timestamps
    end
  end
end
