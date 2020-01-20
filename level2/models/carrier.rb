class Carrier

  attr_accessor :code, :delivery_promise, :saturday_deliveries

  def initialize(params = {})
    @code = params[:code]
    @delivery_promise = params[:delivery_promise].to_i
    @saturday_deliveries = params[:saturday_deliveries]
  end

  def delivery_date(shipping_date)
    initial_delivery_date = shipping_date + delivery_promise + 1
    if initial_delivery_date.wday == 6 && !@saturday_deliveries
      return initial_delivery_date + 2
    end
    if initial_delivery_date == 7
      return initial_delivery_date + 1
    end
    return initial_delivery_date
  end
end
