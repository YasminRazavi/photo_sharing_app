class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  attr_accessible :description, :title, :user_id
end
