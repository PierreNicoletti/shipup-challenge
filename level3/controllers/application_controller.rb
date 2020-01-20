require 'date'

class ApplicationController

  def initialize(package_repository, carrier_repository, country_distances_repository)
    @package_repository = package_repository
    @carrier_repository = carrier_repository
    @country_distances_repository = country_distances_repository
  end

  def deliveries
    output = { deliveries: [] }
    @package_repository.all.each do |package|
      expected_delivery = @carrier_repository.find(package.carrier).delivery_date(package.shipping_date)
      output[:deliveries] << { package_id: package.id, expected_delivery: expected_delivery.to_s }
    end
    output
  end

  def save_data(json_file_path, data_hash)
    File.open(json_file_path, 'wb') do |file|
      file.write(JSON.generate(data_hash))
    end
  end

end
