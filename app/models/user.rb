class User < ActiveRecord::Base
  has_many :Discounts
end
