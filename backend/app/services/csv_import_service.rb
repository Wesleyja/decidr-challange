class CsvImportService
  require 'csv'
  include ImportService

  attr_reader :file_blob, :headers, :default
  attr_accessor :data

  def initialize(file_blob: '', default: false)
    @file_blob = file_blob
    @headers = :first_row
    @data = default ? default_csv : import_from_blob
  end


  def import_data
    data.each do |data_row|
      @checked_data = {}
      begin
        validate_format_person(data_row)
        create_person
      rescue => e
        next
        # can do somthing with it/logs whatever 
      end
    end
  end

  private

  def import_from_blob
    CSV.new(file_blob, headers:)
  end

  def default_csv
    CSV.read(DEFAULT_FILE, headers:)
  end
end