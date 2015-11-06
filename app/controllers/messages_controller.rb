class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)

    if @message.save
      MessageMailer.message_email(@message).deliver_now

      respond_to do |format|
        format.json { render json: { status: 'ok' } }
        format.html { redirect_to :back, notice: "Message sent to #{@message.recipient.first_name}!" }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: @message.errors.full_messages }, status: :bad_request }
        format.html do
          flash[:error] = 'There were validation errors sending the message'
          redirect_to :back
        end
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:sender_name, :sender_email, :sender_phone, :body, :recipient_id)
  end
end
