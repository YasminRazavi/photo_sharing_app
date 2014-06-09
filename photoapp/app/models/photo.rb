class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :collection
  has_many :comments
  attr_accessible :caption, :image, :title, :collection_id, :user_id
end
