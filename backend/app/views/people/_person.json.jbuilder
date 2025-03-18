json.firstName person.first_name
json.lastName person.last_name
json.extract! person, :id, :species, :gender, :weapon, :vehicle
json.locations person.locations, :id, :name
json.affiliations person.affiliations, :id, :name