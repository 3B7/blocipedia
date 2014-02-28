class Wiki < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  attr_accessible :title, :body, :public, :collaborator

  scope :visible_to, lambda { |user| user ? scoped : where(public: true) }
  
end
