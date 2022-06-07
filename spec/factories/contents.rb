FactoryBot.define do
  factory :content do
    visit         {'2022/01/01'}
    explain       {'旅行に行きました'}
    prefecture_id {Faker::Number.between(from: 2, to:48)}
    association :user

    after(:build) do |content|
      content.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
