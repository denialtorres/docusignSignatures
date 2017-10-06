class CreateEnvelopes < ActiveRecord::Migration[5.1]
  def change
    create_table :envelopes do |t|
      t.string :docusign_template_id
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
