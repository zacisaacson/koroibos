class FormatStats
  def initialize
    @total_competing_olympians = Olympian.count
    @average_weight = FormatWeight.new
    @average_age = Olympian.average_age
  end
end
