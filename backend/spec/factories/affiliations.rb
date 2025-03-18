FactoryBot.define do
  factory :affiliation do
    name { ["Sith", "Jedi", "Droid"].sample }
  end
end
