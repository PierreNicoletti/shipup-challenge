require 'json'
require_relative '../models/country'

class CountryRepository

  def initialize(input_file_path)
    @countries = []
    serialized_data = File.read(input_file_path)
    JSON.parse(serialized_data)["country_distance"].each do |country_code, distances|
      @countries << Country.new(country_code: country_code, distances: distances)
    end
  end

  def all
    @countries
  end

  def find(country_code)
    @countries.select { |country| country.country_code == country_code }[0]
  end

end
