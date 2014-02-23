class Wiki < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  attr_accessible :title, :body, :public
end
