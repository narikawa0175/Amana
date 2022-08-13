class Reward < ApplicationRecord
  
 belongs_to :user
 
 validates :reward_name, presence: true
 validates :cost_point, presence: true
end
