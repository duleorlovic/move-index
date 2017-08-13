class CreateDiscipline < ActiveRecord::Migration[5.1]
  def change
    create_table :disciplines do |t|
      t.string :name, null: false
      t.integer :gender
      t.integer :distance_m
      t.integer :age_min
      t.integer :age_max
      t.integer :number_of_crew

      t.references :sport, foreign_key: true, null: false
      t.references :event, foreign_key: true, null: false

      t.timestamps
    end
  end
end
