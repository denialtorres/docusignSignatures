class DownloadDocument
  include Interactor

  def call
    client = DocusignRest::Client.new
    context.result = client.get_document_from_envelope(
        envelope_id: context.envelope_id,
        document_id: 1,
        local_save_path: context.path_to_file
      )
  end
end
