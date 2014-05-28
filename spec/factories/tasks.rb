FactoryGirl.define do
  factory :task do
    title 'buy groceries'
    description 'fruit, cereal, milk'

    user
  end
end
