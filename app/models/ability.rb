class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new
       if user.admin?
         can :manage, :all
       elsif user.advisor?
         can :manage, Usertest
         can :manage, User
       else
         can :create, Usertest
       end
  end
end
