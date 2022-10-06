class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Recipe, public: true
    can :read, RecipeFood
    can :read, Food
    return unless user.present?

    can :manage, RecipeFood
    can :manage, Recipe, user: user
    can :manage, Food, user:
  end
end
