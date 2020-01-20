require_relative 'repositories/carrier_repository'
require_relative 'repositories/package_repository'
require_relative 'repositories/country_distance_repository'
require_relative 'controllers/application_controller'

package_repository = PackageRepository.new('data/input.json')
carrier_repository = CarrierRepository.new('data/input.json')
country_distances_repository = CountryDistanceRepository.new('data/input.json')
app_controller = ApplicationController.new(package_repository, carrier_repository, country_distances_repository)

app_controller.save_data('data/output.json', app_controller.deliveries)
