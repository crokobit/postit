Fabricator(:comment_data, from: :comment) do
  body { Faker::Lorem.paragraph }
end

Fabricator(:comment) do
  body { Faker::Lorem.paragraph }
  creator { Fabricate(:user) }
end
