class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # This is just a guest user, in case they have no role
    
    if user.role == "admin"
      can :manage, :all
    else

      can :read, :all
    end

  end

end

