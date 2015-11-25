class ActivitiesController < ApplicationController
  respond_to :html, :js

  before_action :authenticate_user!
  
  def index
    clients = current_user.clients.pluck(:email)
    @activities = SendgridEvent.where(email: clients).order("timestamp ASC")
  end
end
