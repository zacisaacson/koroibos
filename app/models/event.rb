class Event < ApplicationRecord
  validates_presence_of :name

  belongs_to :sport

  has_many :olympian_events
  has_many :olympians, through: :olympian_events

  def medaled_olympians
    olympian_events.where(event_id: id).where.not(medal: "NA")
  end
end
