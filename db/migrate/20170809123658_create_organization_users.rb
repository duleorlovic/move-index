class CreateOrganizationUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_users do |t|
      t.references :organization, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :role

      t.timestamps
    end
    add_index :organization_users, [:organization_id, :user_id], unique: true
  end
end
