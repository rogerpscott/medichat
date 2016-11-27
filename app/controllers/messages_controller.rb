class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    current_user.class == Doctor ? name = "Dr. #{current_user.doctor_profile.last_name}" : name = current_user.patient_profile.first_name
    if message.conversation.status == "open"
      if message.save
        ActionCable.server.broadcast "messages_#{message.conversation.access_token}",
          message: message.content,
          user: name
        head :ok
      end
    else
      render :new
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :conversation_id)
    end
end
