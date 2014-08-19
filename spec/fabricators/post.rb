Fabricator(:post_data, from: :post) do
  title { Faker::Name.title }
  url { Faker::Internet.url }
  description { Faker::Lorem.paragraph }
end

Fabricator(:post) do
  title { Faker::Name.title }
  url { Faker::Internet.url }
  description { Faker::Lorem.paragraph }
  creator { Fabricate(:user) }
end
