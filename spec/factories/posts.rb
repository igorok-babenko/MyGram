FactoryBot.define do
  factory :post do
    association :user

    content { FFaker::Book.content  }
    body { FFaker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/pixel.png')) }

    trait(:with_invalid_image) do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/pixel.txt')) }
    end
  end
end