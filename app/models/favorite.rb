class Favorite < ActiveRecord::Base

  belongs_to :user
  belongs_to :company

  # validates_uniqueness_of :user_id, :scope => [:company_id], :message => "You have already added this photo to favorites"  #this is so user can only add the same company once to their favorite list (ie, no duplicates in favorite list) 

end
