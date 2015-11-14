class InvitationsController < ApplicationController
  
  def new
    @user_invitation = Invitation.new
  end
  
  def create
    # binding.pry
    # todo: Nat, set up the sender
    # invitation_params.sender = current_user
    @user_invitation = Invitation.new(invitation_params)
    @user_invitation.sender = current_user
    if @user_invitation.save
      if current_user
        # todo: Nat, set up mailing system
        # Mailer.deliver_invitation(@user_invitation, signup_url(@user_invitation.token))
        flash[:notice] = "Invitation sent"
        # todo: Nat, when successfully sent redirect to a proper path/page
        redirect_to messages_path
      else
        flash[:notice] = "Thank you, we will notify when Budgie is ready."
        redirect_to root_url
      end
    else
      render :action => 'new'
    end
  end

  private 

  def invitation_params
    params.require(:invitation).permit(:recipient_email, :sender)

    # allow = [:recipient_email]
    # params.require(:invitation).permit(allow)
  end
    
end