require 'date'

class ApplicationController

  def initialize(package_repository, carrier_repository, country_repository)
    @package_repository = package_repository
    @carrier_repository = carrier_repository
    @country_repository = country_repository
  end

  def deliveries
    output = { deliveries: [] }
    @package_repository.all.each do |package|
      distance = @country_repository.find(package.origin_country).distances[package.destination_country].to_i
      carrier = @carrier_repository.find(package.carrier)
      expected_delivery = carrier.delivery_date(package.shipping_date, distance)
      output[:deliveries] << {
        package_id: package.id,
        expected_delivery: expected_delivery.to_s,
        oversea_delay: carrier.oversea_delay(distance)
      }
    end
    output
  end

  def save_data(json_file_path, data_hash)
    File.open(json_file_path, 'wb') do |file|
      file.write(JSON.generate(data_hash))
    end
  end

end


# {
#   "deliveries": [
#     {
#       "package_id": 1,
#       "expected_delivery": "2018-05-11",
#       "oversea_delay": 3
#     },
#     {
#       "package_id": 2,
#       "expected_delivery": "2018-05-15",
#       "oversea_delay": 1
#     },
#     {
#       "package_id": 3,
#       "expected_delivery": "2018-06-15",
#       "oversea_delay": 0
#     }
#   ]
# }
