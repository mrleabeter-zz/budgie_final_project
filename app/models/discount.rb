class Discount < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  belongs_to :company
  accepts_nested_attributes_for :company



  validates :discount_percent,
              numericality: { only_integer: true},
              inclusion: { in: 1..100, message: "must be between 1 and 100"}

  

end
