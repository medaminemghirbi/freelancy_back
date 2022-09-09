module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end


    def disconnect
      ActionCable.server.broadcast(
        "notification_channel",
        type: 'alert', data: "#{current_user} disconnected"
      )
    end
    private
      def find_verified_user
        # or however you want to verify the user on your system
        #access_token = request.params[:'access-token']
        client_email = request.params[:email_client]
        verified_user = User.find_by(email: client_email)
        #&& verified_user.valid_token?(access_token, client_id)

        if verified_user 
          verified_user
        else
          reject_unauthorized_connection
        end
      end
  end
end