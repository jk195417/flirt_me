class Ability
  include CanCan::Ability

  def initialize(user)
    # set guest
    user ||= User.new
    cannot :manage, :all
    # load roles
    user.roles
    # admin
    can :manage, :backstage if user.has_cached_role?(:admin)
  end
end
