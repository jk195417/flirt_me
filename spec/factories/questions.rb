FactoryBot.define do
  factory :question do
    sequence(:content) { |n| "question #{n}" }
    type 'Question'
    sequence(:sequence) { |n| n }
  end
end
