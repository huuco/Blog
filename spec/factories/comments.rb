FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    enable { false }
    parent_id { 1 }
    commentable { nil }
  end
end
