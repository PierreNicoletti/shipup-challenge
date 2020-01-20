require 'json'
require_relative '../models/carrier'

class CarrierRepository

  def initialize(input_file_path)
    @carriers = []
    serialized_data = File.read(input_file_path)
    JSON.parse(serialized_data)["carriers"].each do |carrier|
      @carriers << Carrier.new(
        code: carrier["code"],
        delivery_promise: carrier["delivery_promise"],
        saturday_deliveries: carrier["saturday_deliveries"],
        oversea_delay_threshold: carrier["oversea_delay_threshold"]
      )
    end
  end

  def all
    @carriers
  end

  def find(code)
    @carriers.select { |carrier| carrier.code == code }[0]
  end

end
