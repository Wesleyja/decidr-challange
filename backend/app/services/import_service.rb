module ImportService
  DEFAULT_FILE = "#{Rails.root}/app/services/Sentia Coding Test Data.csv"
  GENDERS = {
    'male' => 0,
    'm' => 0,
    'f' => 1,
    'female' => 1,
    'o' => 2,
    'other' => 2,
  }

  def validate_format_person(data_row)
    raise if person_without_affiliation(data_row)

    data_row.each do |column, value|
      case column
      when "Name"
        full_name(value)
      when "Location"
        multiple_values_split(value, column)
      when "Affiliations"
        multiple_values_split(value, column)
      else
        @checked_data[column] = value
      end
    end
  end

  def multiple_values_split(value, column)
    value_array = value.split(", ")
    @checked_data[column] = value_array
  end

  def person_without_affiliation(data_row)
    data_row["Affiliations"].blank?
  end

  def full_name(value)
    full_name = value.split(" ", 2)
    @checked_data["first_name"] = full_name.first
    @checked_data["last_name"] = 
    if full_name.size == 1
      ''
    else 
      full_name.last
    end 
  end

  def create_person
    ActiveRecord::Base.transaction do
      person = Person.find_or_create_by!(
        first_name: titlecase(@checked_data["first_name"]),
        last_name: titlecase(@checked_data["last_name"]),
        species: @checked_data["Species"],
        gender: person_gender,
        vehicle: @checked_data["Vehicle"],
        weapon: @checked_data["Weapon"],
      )
      person.update(
        locations: locations,
        affiliations: affiliations
      )
    end
  end

  def person_gender
    gender = @checked_data["Gender"]
    raise if gender.nil?

    GENDERS[gender.downcase]
  end

  def locations
    @checked_data["Location"].map do |location|
      Location.find_or_create_by(name: location.titlecase)
    end
  end

  def affiliations
    @checked_data["Affiliations"].map do |affiliation|
      Affiliation.find_or_create_by(name: affiliation.titlecase)
    end
  end

  # would use normal titlecase method but got anouyed with it stripping symbols from names
  def titlecase(value)
    if value.match?(/[^a-zA-Z\s]+/)
      split_value = value.split('')
      split_value[0] = split_value[0].capitalize
      split_value.join
    else 
      value.titlecase
    end
    
  end
end