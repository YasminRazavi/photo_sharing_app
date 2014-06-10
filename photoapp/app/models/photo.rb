class Photo < ActiveRecord::Base
  attr_accessible :caption, :image, :title, :collection_id, :user_id, :tag_list
  belongs_to :user, :class_name=> "User", :foreign_key => "user_id"
  belongs_to :collection, :class_name=> "Collection", :foreign_key => "collection_id"
  has_many :comments

  acts_as_votable
  acts_as_taggable_on :tags

  def as_json(options)
    {
      id: id,
      caption: caption, 
      collection_id: collection_id,
      user_id: user_id,
      title: title,
      image: image, 
      tags: tags,
      user: {
        name: user.first_name,
        avatar: user.avatar
      },
      likes: get_likes.size
    }
  end
end