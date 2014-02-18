class Wiki < ActiveRecord::Base
  has_many :articles
  attr_accessible :title, :body, :public
end
