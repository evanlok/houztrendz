class ReportsController < ApplicationController
  respond_to :html
  before_action :authenticate_user!

  def index
    events = SendgridEvent.joins(client: :user).merge(User.where(id: current_user.id))
    @activeclients = events.select(:email).where("event=? or event=?",'open','click').order(email: :desc).group("sendgrid_events.email").count
    @open_rate = current_user.get_open_rate(current_user.id)
    @clicks = current_user.get_clicks(current_user.id)
    @opened = current_user.get_open(current_user.id)
  end
end

