class Api::V1::EventsController < ApplicationController
  def index
    render json: FormatSportsCollection.new(Sport.all)
  end

  def show
    event = Event.find(params[:id])
    medalists = event.medaled_olympians
    render json: FormatSpecificEvent.new(event, medalists)
  end
end
