class NotificationChannel < ApplicationCable::Channel
  # Called when the consumer successfully subscribes to this channel
  def subscribed
    stream_from "notification_channel"
  end
  
  def unsubscribed
    # Wow! Action Cable cannot handle this
    # transmit type: 'success', data: 'Notifications turned off. Good-bye!'
  end
end