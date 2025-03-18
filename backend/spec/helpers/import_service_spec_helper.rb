require 'csv'

class DummyImportService
  include ImportService
  attr_accessor :checked_data

  def initialize
    @checked_data = {}
  end 
end

module ImportServiceSpecHelper

  def csv_file
    CSV.read("#{Rails.root}/spec/helpers/csv-test.csv", headers: :first_row)
  end

  def row_normal
    csv_file.first
  end

  def row_without_aff
    csv_file[1]
  end

  def row_multiple_location
    csv_file[-1]
  end

  def row_symbols_in_name
    csv_file[2]
  end

  def invalid_person_row
    csv_file[3]
  end

  def invalid_gender_row
    csv_file[4]
  end

  def normal_person_format
    {"first_name"=>"Darth", "last_name"=>"Vadar", "Location"=>["Death Star"], "Species"=>"Human", "Gender"=>"Male", "Affiliations"=>["Sith"], "Weapon"=>"Lightsaber", "Vehicle"=>"Tiefighter"}
  end

  def multiple_location_format
    {"Location"=>["Naboo", "Naboo2"]}
  end

end