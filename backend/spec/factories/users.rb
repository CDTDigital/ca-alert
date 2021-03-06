FactoryGirl.define do
  factory :user do
    provider 'email'
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    uid { email }

    factory :confirmed_user do
      confirmed_at 2.weeks.ago

      factory :admin_user do
        after(:create) do |user, evaluator|
          user.add_role(:admin)
        end
      end
    end
  end
end
