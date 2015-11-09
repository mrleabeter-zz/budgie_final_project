class User < ActiveRecord::Base

  has_many :discounts, dependent: :nullify
  has_secure_password

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

   


  private

  def valid_email?
    errors.add(:email, "This isn't a valid email.") unless email =~ /\A[\w+\-.]{3,}@[a-z\d\-.]{3,}\.[a-z]{2,}\z/i
  end

end