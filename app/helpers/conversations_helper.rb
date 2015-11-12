module ConversationsHelper

  def conversations
    conversation.to_me?(current_user) ? other_person = conversation.sender : 
    other_person = conversation.recipient
  end
end  