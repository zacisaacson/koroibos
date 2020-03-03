class Olympian < ApplicationRecord
  validates_presence_of :name,
                      :sex,
                      :age,
                      :height,
                      :weight,
                      :team

  belongs_to :sport

  has_many :olympian_events
  has_many :events, through: :olympian_events

  def total_medals_won
    olympian_events.where.not(medal: 'NA').length
  end

  def self.get_youngest
    order(:age).limit(1)
  end

  def self.get_oldest
    order(age: :desc).limit(1)
  end
end
