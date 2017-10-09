class HomeController < ApplicationController
  def index
    @envelopes = Envelope.all
  end

  def result
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
