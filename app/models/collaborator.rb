class Collaborator < ActiveRecord::Base
  belongs_to :wiki
  attr_accessible :index, :name, :wiki, :user_id
  has_many :users
end
