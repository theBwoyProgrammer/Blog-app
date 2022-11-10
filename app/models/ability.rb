class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    return unless user.present?

    can :create, Like
    can :create, Comment
    can :create, Post
    can :destroy, Post do |post|
      post.try(:user) == user
    end
    can :destroy, Comment do |comment|
      comment.try(:user) == user
    end
    can :destroy, Like do |like|
      like.try(:user) == user
    end
    can :update, Post do |u|
      u.try(:user) == user
    end
    can :update, Comment do |u|
      u.try(:user) == user
    end
    return unless user.admin?

    can :manage, :all
  end

  # Define abilities for the user here. For example:
  #
  #   return unless user.present?
  #   can :read, :all
  #   return unless user.admin?
  #   can :manage, :all
  #
  # The first argument to `can` is the action you are giving the user
  # permission to do.
  # If you pass :manage it will apply to every action. Other common actions
  # here are :read, :create, :update and :destroy.
  #
  # The second argument is the resource the user can perform the action on.
  # If you pass :all it will apply to every resource. Otherwise pass a Ruby
  # class of the resource.
  #
  # The third argument is an optional hash of conditions to further filter the
  # objects.
  # For example, here the user can only update published articles.
  #
  #   can :update, Article, published: true
  #
  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
end
