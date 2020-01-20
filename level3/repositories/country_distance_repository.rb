require 'json'
require_relative '../models/country_distance'

class CountryDistanceRepository

  def initialize(input_file_path)
    @country_distances = []
    serialized_data = File.read(input_file_path)
    JSON.parse(serialized_data)["country_distance"].each do |country_code, distances|
      @country_distances << CountryDistance.new(country_code: country_code, distances: distances)
    end
  end

  def all
    @country_distances
  end

end
