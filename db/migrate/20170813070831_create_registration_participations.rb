class CreateRegistrationParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :registration_participations do |t|
      t.references :registration, foreign_key: true
      t.references :participation, foreign_key: true
    end
    add_index :registration_participations, [:registration_id, :participation_id], unique: true, name: 'i_registration_participations_uniq'
  end
end
