FactoryBot.define do
  factory :comment do
    association :user
    association :post

    comment { FFaker::Lorem.sentence }
  end
end