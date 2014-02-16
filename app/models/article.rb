class Article < ActiveRecord::Base
  belongs_to :wiki
  attr_accessible :body, :title
end
