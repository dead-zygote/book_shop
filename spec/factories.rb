FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "Book #{n}" }
    description { "Something about #{title}..." }
    pages_count 120
    price 250
    quantity 10
  end
  
  factory :address do
    region { Region.find_or_create_by_name('Example Region') }
    postcode '123456'
    place 'Example Place'
    address 'Example Street, 12-13'
    receiver_name 'Example Receiver'
  end
  
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password '123456'
  end
end
