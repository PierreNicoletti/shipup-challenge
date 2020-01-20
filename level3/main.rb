require_relative 'repositories/carrier_repository'
require_relative 'repositories/package_repository'
require_relative 'repositories/country_repository'
require_relative 'controllers/application_controller'

package_repository = PackageRepository.new('data/input.json')
carrier_repository = CarrierRepository.new('data/input.json')
country_repository = CountryRepository.new('data/input.json')
app_controller = ApplicationController.new(package_repository, carrier_repository, country_repository)

p package_repository.all
p carrier_repository.all
p country_repository.all

app_controller.save_data('data/output.json', app_controller.deliveries)
