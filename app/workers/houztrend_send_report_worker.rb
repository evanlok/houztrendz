class HouztrendSendReportWorker
  include SideKiq::Worker
  sidekiq_options queue: :critical

  def perform
    @clients = Client.all
    @clients.each do |client|
      begin
        HouztrendzClientEmail.send_report(client, Time.now.month)
      rescue => e
        Honeybadger.notify(e)
      end
    end
  end
end
