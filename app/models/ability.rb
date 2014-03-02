class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user
    if user.role? :member
      can [:create, :read], Wiki 
      can :update, Wiki
    end

    # Moderators can delete any post
    if user.role? :moderator
      can :destroy, Wiki
    end

    # Premium users can create Private wikis
    if user.role? :premium
      can :manage, Wiki, :id => user.id
    end

    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end

    can :read, Wiki, public: true
  end
end