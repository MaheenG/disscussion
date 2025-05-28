class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Discussion
    can :read, Reply

    if user.persisted?
      can [:create, :update, :destroy], Discussion, user_id: user.id
      can [:create, :update, :destroy], Reply, user_id: user.id
    end
  end
end
