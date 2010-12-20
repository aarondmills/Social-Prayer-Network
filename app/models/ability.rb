class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # This is just a guest user, in case they have no role
    
     can :manage, :all if user.role == "admin"
     can :manage, Prayer if user.role == "moderator"
    if user.role == 'member'
      can :read, [User, Prayer, Category, Resource]
      can :create, Prayer
      can :update, Prayer do |prayer|
        prayer.try(:user) == user
      end
    else

      can :read, :all
    end

  end

end

