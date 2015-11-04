class Category < ActiveRecord::Base
  has_many :companies
  has_many :discounts
end
