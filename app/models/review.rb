class Review < ApplicationRecord
  belongs_to :commentable, :polymorphic => true
  has_many :reviews, :as => :commentable
  includes Bootsy::Container
  belongs_to :user
  
  def plan
    return @plan if defined?(@plan)
    @plan = commentable.is_a?(Plan) ? commentable : commentable.plan
  end
end
