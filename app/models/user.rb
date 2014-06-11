class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role, :bio, :avatar
  # attr_accessible :title, :body
  has_many :collections
  has_many :photos
  has_many :comments
  validates :first_name, presence: true
  validates :last_name, presence: true


  before_create :set_default_role

  private
  def set_default_role
    self.role ||= 'user'
  end
end
