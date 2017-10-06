class Envelope < ApplicationRecord
  has_many :envelope_users
  has_many :users, through: :envelope_users

  def self.create_from_template(template_id, roles={})
    puts "Estas en envelope"
    envelope = Envelope.new(docusign_template_id: template_id)
    roles.each do |user|
      #binding.pry
      envelope.envelope_users.new(role: user.keys.first, user_id: user[user.keys.first].id )
    end

    client = DocusignRest::Client.new
    #binding.pry
    envelope_response = client.create_envelope_from_template(
      status: 'sent',
      email: {
        subject: "The test email subject envelope",
        body: "Envelope body content here"
      },
      template_id: template_id,
      signers: envelope.envelope_users.map{ |eu| {
        role_name: eu.role,
        name: eu.user.name,
        email: eu.user.email
        }
      }
    )
  end
end

#Envelope.create_from_template(
 #Setting.template, [
  #    {
  #      'landlord' => user
  #    },{
  #      'tenant' => tenant
  #   }
  # ]
# )
