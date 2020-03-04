class FormatSpecificEvent
  def initialize(event, medalists)
    @event = event.name
    @medalists = medalists.map { |medalist| FormatMedalist.new(medalist)}
  end
end
