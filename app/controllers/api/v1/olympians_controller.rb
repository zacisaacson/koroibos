class Api::V1::OlympiansController < ApplicationController
  def index
    if !request.query_string.present?
      render json: FormatAllOlympians.new(Olympian.all)
    elsif params[:age] == 'youngest'
      render json: FormatAllOlympians.new(Olympian.get_youngest)
    else
      render json: {error: "Please enter correct parameters"}, status: 400
    end
  end
end
