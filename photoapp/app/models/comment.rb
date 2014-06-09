class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  attr_accessible :text, :photo_id, :user_id
end
