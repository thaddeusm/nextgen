class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
  has_many :feeds, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_one :plan
  validates :name, presence: true
end
