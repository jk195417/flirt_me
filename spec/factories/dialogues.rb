FactoryBot.define do
  factory :dialogue do
    after(:create) do |d|
      create(:question, dialogue_id: d.id)
      create(:answer, dialogue_id: d.id)
    end
  end
end
