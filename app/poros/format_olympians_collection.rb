class FormatOlympiansCollection
  def initialize(olympians)
    @olympians = olympians.map { |olympian| FormatOlympian.new(olympian)  }
  end
end
