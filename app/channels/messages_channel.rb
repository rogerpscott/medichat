class MessagesChannel < ApplicationCable::Channel

  def subscribed
    stream_from "messages_#{params[:access_token]}"
  end

end
