class Country

  attr_accessor :country_code, :distances

  def initialize(params = {})
    @country_code = params[:country_code]
    @distances = params[:distances]
  end

end
