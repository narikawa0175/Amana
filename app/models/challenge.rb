class Challenge < ApplicationRecord
 
 belongs_to :user
 
 validates :name, presence: true
 validates :point,presence: true
end
