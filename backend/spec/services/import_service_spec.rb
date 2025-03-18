require 'rails_helper'

RSpec.describe "ImportService" do
  include ImportServiceSpecHelper

  subject { DummyImportService.new }

  context "#validate_format_person" do
    specify do
      subject.validate_format_person(row_normal)
      expect(subject.checked_data).to eq(normal_person_format)
    end

    it "error from no affiliation" do
      expect {
        subject.validate_format_person(row_without_aff)
      }.to raise_error
    end
  end

  context "#multiple_values_split" do
    specify do
      subject.multiple_values_split("Naboo, Naboo2", "Location")
      expect(subject.checked_data).to eq(multiple_location_format)
    end

    it "only one location" do
      subject.multiple_values_split("Naboo", "Location")
      expect(subject.checked_data).to eq({"Location"=>["Naboo"]})
    end
  end

  context "#person_without_affiliation" do
    specify do
      expect(subject.person_without_affiliation(row_without_aff)).to be true
      expect(subject.person_without_affiliation(row_normal)).to be false
    end
  end

  context "#full_name" do
    it "first and last name" do
      subject.full_name("Wesley Alcock")
      expect(subject.checked_data).to eq({"first_name"=>"Wesley", "last_name" => "Alcock"})
    end

    it "only one name" do
      subject.full_name("Wesley")
      expect(subject.checked_data).to eq({"first_name"=>"Wesley", "last_name" => ""})
    end
  end

  context "#create_person" do

    it "person already exists" do
      subject.validate_format_person(row_normal)
      subject.create_person
      expect { subject.create_person }.not_to \
      change(Person, :count)

    end

    it "person without required infomation" do
      subject.validate_format_person(invalid_person_row)
      expect{
        subject.create_person
      }.to raise_error 
    end

    specify do
      subject.validate_format_person(row_normal)
      expect { subject.create_person }.to \
      change(Person, :count).by(1)
    end

  end

  context "#person_gender" do
    specify do
      subject.validate_format_person(row_normal)
      expect(subject.person_gender).to eq 0
    end

    it "no gender" do
      subject.validate_format_person(invalid_person_row)
      expect{ subject.person_gender }.to raise_error
    end

    it "invalid gender" do
      subject.validate_format_person(invalid_gender_row)
      expect(subject.person_gender).to eq nil
    end
  end

  context "#titlecase" do
    specify do
      expect(subject.titlecase("wes")).to eq("Wes")
    end


    it "symbols in name" do
      expect(subject.titlecase("c-3PO")).to eq("C-3PO")
    end

  end

end