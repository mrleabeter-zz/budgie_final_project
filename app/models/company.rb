class Company < ActiveRecord::Base
  has_many :discounts
  has_many :favorites
  has_many :categories

  belongs_to :user

  validates :company_name,
             presence: true

  mount_uploader :logo, ImageUploader 
  mount_uploader :store_pic, ImageUploader                    

  scope :with_discounts, -> { includes(discounts: :user)
  .where.not(users: { id: nil})
  .where.not(discounts: { id: nil }) }
end
