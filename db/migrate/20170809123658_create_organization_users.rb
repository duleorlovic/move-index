class CreateOrganizationUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_users do |t|
      t.references :organization
      t.references :user
      t.integer :role

      t.timestamps
    end
    add_index :organization_users, [:organization_id, :user_id], unique: true
  end
end
