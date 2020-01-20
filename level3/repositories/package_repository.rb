require 'json'
require_relative '../models/package'

class PackageRepository

  def initialize(input_file_path)
    @packages = []
    serialized_data = File.read(input_file_path)
    JSON.parse(serialized_data)["packages"].each do |package|
      @packages << Package.new(
        id: package["id"],
        carrier: package["carrier"],
        shipping_date: package["shipping_date"],
        origin_country: package["origin_country"],
        destination_country: package["destination_country"]
      )
    end
  end

  def all
    @packages
  end

  def find(id)
    @packages[id]
  end

end

