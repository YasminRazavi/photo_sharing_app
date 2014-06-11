class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == :admin
      can :manage, :all
    elsif user.role == "user"
      can :read, :all  
      can :create, [Comment, Photo, Collection]  
      can [:update, :destroy], Photo do |photo|
        photo.try(:user) == user
      end
      can [:update, :destroy], Collection do |collection|  
        collection.try(:user) == user
      end   
      can :destroy, Comment do |comment|  
        comment.try(:user) == user 
      end
    end 
  end
end
