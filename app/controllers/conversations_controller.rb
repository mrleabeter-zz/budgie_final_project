class ConversationsController < ApplicationController

  def index
   @users = User.all
   @conversations = Conversation.sent_or_received_by(current_user).order(updated_at: :desc)
  end

  def create
   if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],
       params[:recipient_id]).first
   else
    @conversation = Conversation.create!(conversation_params)
   end

   if params[:message]
    @conversation.messages.create(body:params[:message], user_id: params[:sender_id])
    
   end 

   @user = User.find(params[:sender_id])
   redirect_to user_favorites_path(@user)
   # redirect_to conversation_messages_path(@conversation)
  end
  
  private
   def conversation_params
    params.permit(:sender_id, :recipient_id)
   end


end