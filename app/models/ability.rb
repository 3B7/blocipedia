class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user
    if user.role? :member
      can :manage, Wiki, :user_id => user.id 
      can :manage, Wiki, :collaborators => { :user_id => user.id }
    end

    # Premium users can create Private wikis
    if user.role? :premium
      can :manage, Wiki, :user_id => user.id
    end

    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end

    can :read, Wiki, public: true
  end
end