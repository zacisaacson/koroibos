class Api::V1::OlympianStatsController < ApplicationController
  def show
    render json: FormatStatsCollection.new
  end
end
