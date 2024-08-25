class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.has_role? :admin
      can :manage, :all
    else
      # Guest user abilities
      can :read, [Discussion, Channel, Reply]
      
      if user.persisted? # Logged in user
        # Discussion abilities
        can :create, Discussion
        can [:update, :destroy], Discussion, user_id: user.id
        
        # Reply abilities
        can :create, Reply
        can [:update, :destroy], Reply, user_id: user.id
      end
    end
  end
end
