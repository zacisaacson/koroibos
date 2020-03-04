class Sport < ApplicationRecord
  validates_presence_of :name

  has_many :olympians
  has_many :events

  def self.sorted_name
    order(:name)
  end

  def event_name
    events.pluck(:name)
  end

end
