class FormatWeight
  def initialize
    @unit = "kg"
    @male_olympians = Olympian.male_average
    @female_olympians = Olympian.female_average
  end
end
