class SendgridEvent < ActiveRecord::Base

  belongs_to :client, :inverse_of => :sendgrid_events

end
