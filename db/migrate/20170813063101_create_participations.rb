class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.references :race, foreign_key: true, null: false

      t.timestamps
    end
  end
end
