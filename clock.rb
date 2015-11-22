require 'clockwork'
require './config/boot'
require './config/environment'

#This file is for the scheduled workers to be ran for sending out emails and collecting mixpanel data useing sidkiq

module Clockwork
  every(1.day, 'Send Houztrendz report', :if => lambda { |t| t.day == 1 }, :at => '09:00') { HouztrendSendReportWorker.perform_async }
  every(1.day, 'Send Monthly User report', :if => lambda { |t| t.day == 1 }, :at => '09:00') { UserReportWorker.perform_async }
end
