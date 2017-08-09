class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.integer :category
      t.string :username
      t.datetime :birth_date
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :website
      t.string :email
      t.string :phone_number
      t.string :mobile_phone_number
      t.string :national_registration_id
      t.integer :status
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
