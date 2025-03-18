class ImportFromCsvJob < ApplicationJob
  DEFAULT_FILE = "#{Rails.root}/app/services/Sentia Coding Test Data.csv"
  queue_as :urgent

  def perform( file_url: DEFAULT_FILE, headers: :first_row )
    CsvImportService.new(
      file_url,
      headers
    ).import_data
  end
end

# Job is not being used, just added it in my rabbithole spree, would want the upload to run as a background job in future
