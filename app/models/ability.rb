class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    can :read, :all
    can :destroy, Food, user_id: user.id
    can :manage, Food, user_id: user.id

  end
end
