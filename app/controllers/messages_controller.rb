class MessagesController < ApplicationController
  before_action :authenticate_conversation_user, only: [:index]
  before_action :load_conversation, except: [:update]  

  def index
   @messages = @conversation.messages.all
    if @messages.length > 10
     @over_ten = true
     @messages = @messages[-10..-1]
    end
    if params[:m]
     @over_ten = false
     @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
       @messages.last.read = true;
      end
    end
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      @conversation.touch
      # render json: { conversation_id: @conversation.id }
      redirect_to conversation_messages_path(@conversation)
    end
  end

  def update
    @message = Message.find(params[:id])
    @message.read = true
    @message.save
    render nothing: true
  end

  private
    def message_params
    params.require(:message).permit(:body, :user_id)
    end

    def authenticate_conversation_user
      @conversation = Conversation.find(params[:conversation_id])
      unless (@conversation.sender == current_user || @conversation.recipient == current_user)
        redirect_to(:root, alert: "Not allowed")
      end  
    end 

    def load_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

end