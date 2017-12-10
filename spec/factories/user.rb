FactoryBot.define do
  sequence(:email) { |n| "user#{n}@flirt.me" }
  sequence(:password) { |n| "flirtmeuser#{n}" }

  factory :user do
    email
    password
  end

  factory :admin, class: User do
    email
    password
    after(:create) { |user| user.add_role(:admin) }
  end
end
