class CreateEnvelopeUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :envelope_users do |t|
      t.integer :envelope_id
      t.integer :user_id
      t.string :role

      t.timestamps
    end
  end
end
