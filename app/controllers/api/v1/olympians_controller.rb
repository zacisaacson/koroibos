class Api::V1::OlympiansController < ApplicationController
  def index
    render json: FormatAllOlympians.new(Olympian.all)
  end
end
