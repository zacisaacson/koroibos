class FormatOlympian
  def initialize(olympian)
    @name = olympian.name
    @team = olympian.team
    @age = olympian.age
    @sport = olympian.sport.name
    @total_medals_won = olympian.total_medals_won
  end
end
