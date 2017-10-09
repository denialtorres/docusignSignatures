class AddDocusignEnvelopeIdToEnvelopers < ActiveRecord::Migration[5.1]
  def change
    add_column :envelopes, :docusign_envelope_id, :string
  end
end
