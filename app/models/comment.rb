class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  attr_accessible :text, :photo_id, :user_id
  validates :text, presence: true

  def as_json(options)
    {
      text: text, 
      user_id: user_id,
      user:{
        name:user.first_name ,
        avatar: user.avatar.url
      }
    }
  end
end
