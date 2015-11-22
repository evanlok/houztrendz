class HouztrendzClientEmail < ApplicationMailer
  default from: 'admin@houztrendz.com'

  def send_report(client)
    mail(:to => @client.email, :subject => "Houztrendz Monthly Report")
  end
end
