class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, [User, Idea], id: user.id
      can :create, Idea
    end
  end
end
