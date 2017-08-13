class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.references :participation, foreign_key: true, null: false
      t.references :check_point, foreign_key: true, null: false
      t.float :time_in_s
    end
    add_index :results, %i[participation_id check_point_id], unique: true
  end
end
