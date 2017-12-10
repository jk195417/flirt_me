FactoryBot.define do
  factory :sentence do
    sequence(:content) { |n| "sentence #{n}" }
    sequence(:sequence) { |n| n }
  end
end
