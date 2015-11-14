class User < ActiveRecord::Base

  has_many :discounts, dependent: :nullify
  has_many :companies
  has_many :favorites
  has_many :sent_invitations, :class_name => 'Invitation', :foreign_key => 'sender_id'
  belongs_to :invitation
  has_secure_password
  
  before_create :set_invitation_limit

  # attr_accessor :username, :email, :password, :password_confirmation

   validates :username,
               presence: true,
               uniqueness: true, 
               length: {maximum: 25}
   # validates :password,
   #             presence: true,
   #             length: { minimum: 6, message: 'must be at least 6 characters' }
   validates :email,
               presence: true,
               uniqueness: true
   validate :valid_email?

   # validates :invitation_id,
   #              presence: true

  def invitation_token
    invitation.token if invitation
  end
  
  def invitation_token=(token)
    self.invitation = Invitation.find_by_token(token)
  end
  
  private

  def valid_email?
    errors.add(:email, "This isn't a valid email.") unless email =~ /\A[\w+\-.]{3,}@[a-z\d\-.]{3,}\.[a-z]{2,}\z/i
  end

  def add_favorite(company)
    if self.favorites.where(company: company_id).empty?
      Favorite.create(user: self, company: company_id)
    end
  end
  
  def set_invitation_limit
    self.invitation_limit = 3
  end

end
