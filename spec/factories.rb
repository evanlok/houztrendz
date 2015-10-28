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

    trait :admin do
      admin true
    end
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

  factory :core_logic_location do
    date Date.today
    sequence(:county_name) { |n| "County #{n}" }
    state 'CA'
    cbsa_name 'San Francisco Bay Area'
    zip_code { Faker::Address.zip_code }
    tier_name 'Single Family Combined'
    new_listings_inventory_count 100
    new_listings_inventory_count_12m_change 10
    active_listings_inventory_count 200
    active_listings_inventory_count_1m_change 15
    sold_inventory_count 50
    sold_inventory_count_12m_change 5
    sold_inventory_count_1m_change 8
    sold_listings_dom_mean 11
    sold_listings_dom_mean_12m_change 4
    sold_list_price_mean 575000
    sold_list_price_mean_12m_change 6
    sold_list_price_mean_1m_change 7
    active_list_price_mean 450000
    active_list_price_median 520000
    active_listings_dom_mean 21
    cumulative_active_dom_mean 25
  end
end
