class Wiki < ActiveRecord::Base
  attr_accessible :title, :body, :public, :collaborators
  has_many :collaborators, dependent: :destroy
  belongs_to :user

  scope :visible_to, lambda { |user| user ? scoped : where(public: true) }
  
end
