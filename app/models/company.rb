class Company < ActiveRecord::Base
  has_many :discounts
  has_many :categories

  validates :company_name,
             presence: true

end
