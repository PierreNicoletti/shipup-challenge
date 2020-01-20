class Carrier

  attr_accessor :code, :delivery_promise, :saturday_deliveries, :oversea_delay_threshold

  def initialize(params = {})
    @code = params[:code]
    @delivery_promise = params[:delivery_promise].to_i
    @saturday_deliveries = params[:saturday_deliveries]
    @oversea_delay_threshold = params[:oversea_delay_threshold].to_i
  end

  def delivery_date(shipping_date, distance)
    delivery_date = shipping_date + delivery_promise + 1 + oversea_delay(distance)
    if delivery_date.wday == 6 && !@saturday_deliveries
      delivery_date += 2
    end
    if delivery_date.wday == 0
      delivery_date += 1
    end
    return delivery_date
  end

  def oversea_delay(distance)
    distance / @oversea_delay_threshold
  end
end
