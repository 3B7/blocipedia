class Collaborator < ActiveRecord::Base
  belongs_to :wiki
  attr_accessible :index, :name, :wiki
  has_many :users
  has_one :collaborator, dependent: :destroy
end
