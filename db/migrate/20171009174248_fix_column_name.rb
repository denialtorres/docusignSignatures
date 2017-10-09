class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :envelopes, :name, :email_landlord
    add_column :envelopes, :email_tenant, :string
  end
end
