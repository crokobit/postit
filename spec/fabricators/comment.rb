Fabricator(:comment_data, from: :comment) do
  body { Faker::Lorem.paragraph }
end
