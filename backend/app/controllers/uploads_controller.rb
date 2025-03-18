class UploadsController < ApplicationController

  def upload_from_csv_file
    file_blob = params["_json"]
    if file_blob.present?
      CsvImportService.new(file_blob:).import_data
      render json: { message: "Upload Complete" }, status: 200
    else 
      render json: { error: "No file uploaded" }, status: :unprocessable_entity
    end
  end

  def upload_default_csv
    CsvImportService.new(default: true).import_data

    render json: { message: "Upload Complete" }, status: 200
  end

end