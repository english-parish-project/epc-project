class Church < ActiveRecord::Base
  resourcify
  
  has_one :fabric
end
