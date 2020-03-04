class FormatSportsCollection
  def initialize(sports)
    @events = sports.sorted_name.map { |sport| FormatEvent.new(sport)  }
  end
end
