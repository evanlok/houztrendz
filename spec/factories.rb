FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password 'test1234'
    title { Faker::Lorem.word }
    phone '415-456-7890'
    biography { Faker::Lorem.paragraph }
    sequence(:bre_number) { |n| "BRE#{n}" }
  end

  factory :theme do
    sequence(:name) { |n| "Theme #{n}" }
    sequence(:class_name) { |n| "Theme#{n}" }
    active true
  end

  factory :video do
    theme
    user
    location { Faker::Address.zip_code }
    background_color '#ffffff'
    title { Faker::Lorem.sentence }
    url_sd { Faker::Internet.url }
    url_hd { Faker::Internet.url }
    duration 180
    sequence(:hal_id) { |n| n }

    trait :new do
      hal_id nil
      duration nil
      url_sd nil
      url_hd nil
    end
  end
end
