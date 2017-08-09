class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :starts_at, null: false
      t.datetime :ends_at
      t.datetime :registration_opens_at
      t.datetime :registration_ends_at
      t.string :email
      t.string :website
      t.integer :status
      t.float :latitude
      t.float :longitude

      t.references :organization

      t.timestamps
    end
  end
end
