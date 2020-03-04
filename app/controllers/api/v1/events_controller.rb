class Api::V1::EventsController < ApplicationController
  def show
    render json: FormatSportsCollection.new(Sport.all)
  end
end
