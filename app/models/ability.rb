class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new
       if user.admin?
         can :manage, :all
       else
         can :create, Usertest
         can :read, Usertest, :user_id => user.id
       end


  end
end
