class Carrier

  attr_accessor :code, :delivery_promise

  def initialize(params = {})
    @code = params[:code]
    @delivery_promise = params[:delivery_promise].to_i
  end

  def delivery_date(shipping_date)
    return shipping_date + delivery_promise + 1
  end
end
