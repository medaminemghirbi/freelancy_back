class MessageController < ApplicationController
  include CurrentUserConcern
  def sendmessage
    @message = Message.new(post_params)
    if @message.save
      render json: @message, statut: :created, location: @message

    else
      render json: @message.errors, statut: :unprocessable_entity
    end
  end

  def getmessagebysender
    @message = Message.where(sender_id: params[:sender_id], receiver_id: params[:receiver_id]).order('created_at ASC')
    
    render json: { message: @message }, include: %i[sender receiver]
  end

  def getmessagebyreceiver
    @message = Message.where(receiver_id: params[:receiver_id],
                             sender_id: params[:sender_id]).order('created_at ASC')
    render json: { message: @message }, include: %i[sender receiver]
  end

  def post_params
    params.permit(:sender_id, :receiver_id, :text)
  end
end
