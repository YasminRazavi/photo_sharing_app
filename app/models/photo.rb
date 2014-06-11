class Photo < ActiveRecord::Base
  attr_accessible :caption, :image, :title, :collection_id, :user_id, :tag_list, :remote_image_url
  belongs_to :user, :class_name=> "User", :foreign_key => "user_id"
  belongs_to :collection, :class_name=> "Collection", :foreign_key => "collection_id"
  has_many :comments

  mount_uploader :image, ImageUploader

  acts_as_votable
  acts_as_taggable_on :tags

  validates :collection_id, presence: true
  validates :image, presence: true

  def as_json(options)
    {
      id: id,
      caption: caption, 
      collection_id: collection_id,
      user_id: user_id,
      title: title,
      image: image.url, 
      tags: tags,
      user: {
        name: user.first_name,
        avatar: user.avatar
      },
      likes: get_likes.size
    }
  end

end