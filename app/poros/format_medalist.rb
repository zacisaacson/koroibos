class FormatMedalist
  def initialize(medalist)
    @name = medalist.olympian.name
    @team = medalist.olympian.team
    @age = medalist.olympian.age
    @medal = medalist.medal
  end
end
