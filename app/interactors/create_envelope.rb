class CreateEnvelope
  include Interactor

  def call
    # TODO
    puts "VAAAAAAAAAAAAAAS A CREAR UN ENVELOPE"
    Envelope.create_from_template(
      Setting.template, [
            {
              'landlord' => context.landlord
            },{
              'tenant' => context.tenant
          }
        ]
      )
  end
end
