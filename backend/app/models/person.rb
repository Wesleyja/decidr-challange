class Person < ApplicationRecord
  enum gender: [ :male, :female, :other ]

  validates :first_name, :gender, :species, presence: true

  has_and_belongs_to_many :affiliations
  has_and_belongs_to_many :locations
end
