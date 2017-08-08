class CreateSports < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.text :description
      t.string :icon_url
    end
    add_index :activities, :name, unique: true

    create_table :sports do |t|
      t.string :name, null: false
      t.text :description
      t.string :icon_url
    end
    add_index :sports, :name, unique: true

    create_table :activity_sports do |t|
      t.references :activity, foreign_key: true, null: false
      t.references :sport, foreign_key: true, null: false
    end
    add_index :activity_sports, [:activity_id, :sport_id], unique: true
  end
end
