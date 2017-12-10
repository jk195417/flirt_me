FactoryBot.define do
  factory :answer do
    sequence(:content) { |n| "answer #{n}" }
    type 'Answer'
    sequence(:sequence) { |n| n }
  end
end
