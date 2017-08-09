class CreateOrganizationSports < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_sports do |t|
      t.references :organization, foreign_key: true, null: false
      t.references :sport, foreign_key: true, null: false

      t.timestamps
    end
    add_index :organization_sports, [:organization_id, :sport_id], unique: true
  end
end
