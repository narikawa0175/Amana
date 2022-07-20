class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :lists,dependent: :destroy
  has_many :tasks,dependent: :destroy
  has_many :challenges,dependent: :destroy
  has_many :rewards,dependent: :destroy
  
  validates :total_point, numericality:{greater_than_or_equal_to: 0}
end
