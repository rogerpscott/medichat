class CreatePatientProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_profiles do |t|
      t.integer :patient_id
      t.string :first_name
      t.string :last_name
      t.string :dni
      t.string :phone
      t.integer :age
      t.string :sex
      t.string :blood_type
      t.text :existing_conditions
      t.text :allergies
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
