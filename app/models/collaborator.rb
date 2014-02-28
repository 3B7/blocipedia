class Collaborator < ActiveRecord::Base
  belongs_to :wiki
  attr_accessible :index, :name
  has_many :users
end
