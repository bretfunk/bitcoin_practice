class WelcomeController < ApplicationController
  def index
    raw = Poloniex.ticker
    response = JSON.parse(raw.body, symbolize_names: true)
    @data = response.map do |raw_data|
      PoloniexData.new(raw_data)
    end
  end
end
