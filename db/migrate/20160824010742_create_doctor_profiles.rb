class CreateDoctorProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :doctor_profiles do |t|
      t.integer :doctor_id
      t.boolean :available, default: false
      t.string :last_name

      t.timestamps
    end
  end
end
