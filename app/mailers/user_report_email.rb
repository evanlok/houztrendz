class UserReportEmail < ApplicationMailer
  default from: 'admin@houztrendz.com'

  def send_report(user, month)
    @user = user
    @open_rate = @user.get_open_rate(@user.id)
    @active_clients = @user.get_top_five_active_clients(@user.id)
    report_date = Date.new(Time.now.year, month)
    mail(:to => @user.email, :subject => "Email acitvity monthly report")
  end
end
