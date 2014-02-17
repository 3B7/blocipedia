class Article < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user
  attr_accessible :body, :title

  default_scope order('created_at DESC')
end
