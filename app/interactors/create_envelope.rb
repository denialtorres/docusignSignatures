class CreateEnvelope
  include Interactor

  def call
    # TODO
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
