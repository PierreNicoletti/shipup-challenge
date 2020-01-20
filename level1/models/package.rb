require 'date'

class Package

  attr_accessor :id, :carrier, :shipping_date

  def initialize(params = {})
    @id = params[:id]
    @carrier = params[:carrier]
    @shipping_date = Date.parse(params[:shipping_date])
  end

end
