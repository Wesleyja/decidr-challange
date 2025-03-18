class PeopleController < ApplicationController
  def index
    @people = Person.preload(:locations, :affiliations).all
    # not ideal to preload two associations but still cuts down on n+1s
  end
end
