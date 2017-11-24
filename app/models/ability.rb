class Ability
  include CanCan::Ability

  def initialize(user)
    # set guest
    user ||= User.new
    user.roles

    # admin
    if user.has_cached_role?(:admin)

    end
  end
end
