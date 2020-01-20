class CountryDistance

  attr_accessor :country_code, :distances

  def initialize(params = {})
    @country_code = params[:country_code]
    @distances = params[:distances]
  end

end


  # "country_distance": {
  #   "FR": { "US": 6000, "DK": 1000, "JP": 9500 },
  #   "US": { "FR": 6000, "DK": 5500, "JP": 11000 },
  #   "DK": { "US": 5500, "FR": 1000, "JP": 8500 },
  #   "JP": { "US": 11000, "DK": 8500, "FR": 9500 }
  # }
