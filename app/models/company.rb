class Company < ActiveRecord::Base
  has_many :discounts
  has_many :categories
end
