class Photo < ActiveRecord::Base
  attr_accessible :caption, :image, :title, :collection_id, :user_id, :tag_list
  belongs_to :user, :class_name=> "User", :foreign_key => "user_id"
  belongs_to :collection, :class_name=> "Collection", :foreign_key => "collection_id"
  has_many :comments

  acts_as_votable
  acts_as_taggable_on :tags

  validates :collection_id, presence: true
  validates :image, presence: true

  def as_json(liked_status)
    # if current_user!=
    #   liked_status = current_user.liked? self
    #   puts(liked_status)
    # else
    #   liked_status= ""
    # end
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
      likes: get_likes.size,
      liked_status: liked_status

    }
  end

end