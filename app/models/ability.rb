class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    elsif user.moderator?
      can :read, :all
      can [:create, :update, :destroy], Discussion
      can [:create, :update, :destroy], Reply
      can :moderate, [Discussion, Reply]
    elsif user.member?
      can :read, :all
      can [:create, :update, :destroy], Discussion, user: user
      can [:create, :update, :destroy], Reply, user: user
    else
      can :read, [Channel, Discussion, Reply]
    end
  end
end