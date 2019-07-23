FactoryBot.define do
  factory :user do
    title { "MyString" }
    image { File.open(Rails.root.join("app/assets/images", "no-image-post.jpg"), 'r') }
  end
end
