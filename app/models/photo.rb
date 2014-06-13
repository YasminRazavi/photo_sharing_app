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

  def self.ranked
    # TODO: Replace this n+1 problem with a sql group/count
    # Photo.all.sort_by { |p| p.get_likes.size }.reverse
    (joins(:votes_for).
    group("photos.id").
    order("count(votes.id) DESC") + Photo.all.shuffle).uniq



  end




  def as_json(liked_status, current_user=nil)

    if current_user == user
      current_user = true
    else
      current_user= false
    end

   
    {
      id: id,
      caption: caption, 
      collection_id: collection_id,
      user_id: user_id,
      title: title,
      image: image.url, 
      tags: tags,
      user: {
        current_user: current_user,
        name: user.first_name,
        avatar: user.avatar.url
      },
      likes: get_likes.size,
      liked_status: liked_status

    }
  end

end