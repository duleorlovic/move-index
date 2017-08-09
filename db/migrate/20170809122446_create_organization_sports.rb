class CreateOrganizationSports < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_sports do |t|
      t.references :organization
      t.references :sport

      t.timestamps
    end
    add_index :organization_sports, [:organization_id, :sport_id], unique: true
  end
end
