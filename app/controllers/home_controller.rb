class HomeController < ApplicationController
  def index
    @envelopes = Envelope.all
  end

  def result
  end
  
  def download_document
      path_to_file = "#{Rails.root}/tmp/#{params[:envelope_id]}.pdf"
      result = DownloadDocument.call(path_to_file: path_to_file, envelope_id: params[:envelope_id])
      #binding.pry
      #return path_to_file if result && File.exist?(path_to_file)
      send_file path_to_file, :x_sendfile=>true
  end
  
  def create
   landlord = User.find_or_create_by(email: params[:landlord_email])
   landlord.name = params[:landlord_name]
   if landlord.save
     tenant = User.find_or_create_by(email: params[:tenant_email])
     tenant.name = params[:tenant_name]
     if tenant.save
      CreateEnvelope.call(landlord: landlord, tenant: tenant)
      redirect_to root_path
     end
   end
  end
end
