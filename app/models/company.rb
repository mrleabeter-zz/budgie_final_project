class Company < ActiveRecord::Base
  has_many :Discounts
  enum category: [:electronics, :clothing, :houseware, :food, :attractions, :footwear, :jewelry, :office_supplies, :services, :tools_and_hardware, :travel, :beauty, :baby, :pet, :subscriptions]
end
