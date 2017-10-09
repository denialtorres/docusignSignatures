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
        subject: "TEST SUBJECT",
        body: "TEST BODY"
      },
      template_id: template_id,
      signers: envelope.envelope_users.map{ |eu| {
        role_name: eu.role,
        name: eu.user.name,
        email: eu.user.email
        }
      },
      event_notification: {
        url: "https://signatures-denialtorres.c9users.io/docusign/webhooks.xml",
        logging: true,
        envelope_events: [
          {envelope_event_status_code: "sent"},
          {envelope_event_status_code: "delivered"},
          {envelope_event_status_code: "completed"},
          {envelope_event_status_code: "declined"},
          {envelope_event_status_code: "voided"}
        ]
      }
    )
    
    #binding.pry
    envelope.update(docusign_envelope_id: envelope_response["envelopeId"], 
                    status: envelope_response["status"],
                    email_landlord: roles[0]["landlord"][:email] ,
                    email_tenant: roles[1]["tenant"][:email])
    envelope
  end
end

# Envelope.create_from_template(
# Setting.template, [
#       {
#         'landlord' => user
#       },{
#         'tenant' => tenant
#     }
#   ]
# )
