class Docusign::WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        resp = Hash.from_xml(request.raw_post)
        #binding.pry
        envelope_id = resp["DocuSignEnvelopeInformation"]["EnvelopeStatus"]["EnvelopeID"]
        envelope = Envelope.find_by(docusign_envelope_id: envelope_id)
        envelope.update(status: resp["DocuSignEnvelopeInformation"]["EnvelopeStatus"]["Status"].downcase )
        head :ok
    end
end