class ConversationsController < ApplicationController

  def index
   @users = User.all
   # @conversations = Conversation.where(recipient_id: current_user.id)
    @conversations = Conversation.sent_or_received_by(current_user)

  end

  def create
   if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],
       params[:recipient_id]).first
   else
    @conversation = Conversation.create!(conversation_params)
   end
   redirect_to conversation_messages_path(@conversation)
  end
  
  private
   def conversation_params
    params.permit(:sender_id, :recipient_id)
   end


end