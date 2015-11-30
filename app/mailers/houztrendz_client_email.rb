class HouztrendzClientEmail < ApplicationMailer
  default from: 'admin@houztrendz.com'

  def send_report(client, month)
    @client = client
    @report_date = Date.new(Time.now.year, month)
    mail(:to => @client.email, :subject => "Houztrendz Monthly Report")
  end
end
