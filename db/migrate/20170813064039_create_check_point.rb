class CreateCheckPoint < ActiveRecord::Migration[5.1]
  def change
    create_table :check_points do |t|
      t.references :discipline, foreign_key: true
      t.integer :distance
      t.integer :order
    end
  end
end
