class Article < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user
  attr_accessible :body, :title, :wiki

  default_scope order('created_at DESC')

  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :wiki, presence: true
  validates :user, presence: true
  
end
