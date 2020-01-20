require 'date'

class Package

  attr_accessor :id, :carrier, :shipping_date, :origin_country, :destination_country

  def initialize(params = {})
    @id = params[:id]
    @carrier = params[:carrier]
    @shipping_date = Date.parse(params[:shipping_date])
    @origin_country = params[:origin_country]
    @destination_country = params[:destination_country]
  end

end
