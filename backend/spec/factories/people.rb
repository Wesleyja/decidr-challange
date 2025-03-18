FactoryBot.define do
  factory :person do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    species { Faker::Movies::StarWars.specie }
    gender { (0..2).to_a.sample }
    weapon { ["Gun", "Lightsaber", ""].sample }
    vehicle { Faker::Movies::StarWars.vehicle }


    factory :person_with_locations do
      after(:create) do |person|
        locations = FactoryBot.create_list(:location, 2)
        person.locations = locations
      end
    end

    factory :person_with_affiliations do
      after(:create) do |person|
        affiliations = FactoryBot.create_list(:affiliation, 2)
        person.affiliations = affiliations
      end
    end

    factory :person_with_both do
      after(:create) do |person|
        locations = FactoryBot.create_list(:location, 2)
        person.locations = locations
        affiliations = FactoryBot.create_list(:affiliation, 2)
        person.affiliations = affiliations
      end
    end
  end
end