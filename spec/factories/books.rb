FactoryBot.define do
  factory :book do
    title { Faker::Book.name }
    author { Faker::Book.author }
    category
  end
end
