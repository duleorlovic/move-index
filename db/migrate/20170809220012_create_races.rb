class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|
      t.string :name
      t.datetime :starts_at
      t.integer :category
      t.references :discipline, foreign_key: true, null: false
    end
  end
end
