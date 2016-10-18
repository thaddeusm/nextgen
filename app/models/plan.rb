class Plan < ApplicationRecord
	belongs_to :user
	has_many :reviews, :as => :commentable, dependent: :destroy
	includes Bootsy::Container
end
