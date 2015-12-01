class UserReportWorker
  include Sidekiq::Worker
  sidekiq_options queue: :critical

  def perform
    @users = User.all
    @users.each do |user|
      begin
        UserReportEmail.send_report(user, Time.now.month)
      rescue => e
        Honeybadger.notify(e)
      end
    end
  end
end
