class MessageMailer < ApplicationMailer
  def message_email(message)
    @message = message
    address = Mail::Address.new(@message.sender_email)
    address.display_name = @message.sender_name

    mail(to: @message.recipient.email, from: address.format, subject: "Houztrendz: New Message from #{@message.sender_name}")
  end
end
