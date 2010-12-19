class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # This is just a guest user, in case they have no role
    
    if user.role == "admin"
      can :manage, :all
    elsif user.role == 'moderator'
      can :manage, Prayer
    elsif user.role == 'member'
      can :read, :all
      can :create, Prayer
      can :update, Prayer do |prayer|
        prayer.try(:user) == user
      end
    else

      can :read, :all
    end

  end

end

