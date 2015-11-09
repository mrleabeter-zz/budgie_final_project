class Discount < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  belongs_to :company

  validates :discount_percent,
              numericality: { only_integer: true},
              inclusion: { in: 1..100, message: "must be between 1 and 100"}

  validates :restrictions,
              presence: true,
              length: { in: 5..50 }
              
  scope :with_user, -> { includes(:user)
    .where.not( users:{id: nil}) }            


end