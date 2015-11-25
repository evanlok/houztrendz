class HooksController < ApplicationController
  respond_to :json
  skip_before_filter
  protect_from_forgery :except => :sendgrid_event_callback

  def sendgrid_event_callback
    #returns a list of dictionaries, each dictionary holding a event
    if params[:_json].present?
      params[:_json].each do |resp|
        event = SendgridEvent.new
        event.event = resp["event"]
        event.email = resp["email"]
        event.timestamp = resp["timestamp"]
        event.user_agent = resp["useragent"]
        event.smtp_id = resp["smtp-id"]
        event.client_id = Client.find_by_email(resp["email"]).id
        event.save!
      end
    end
    render :nothing => true, :status => 200
  end

end