class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.string :access_token
      t.string :status
      t.string :diagnosis
      t.string :summary

      t.timestamps
    end
    add_index :conversations, :access_token, unique: true
  end
end
