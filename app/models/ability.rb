class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user
    if user.role? :member
      can :manage, Article, user_id: user.id
      can :read, Wiki
    end

    # Moderators can delete any post
    if user.role? :moderator
      can :destroy, Article
    end

    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end

    can :read, Wiki, public: true
    can :read, Article
  end
end