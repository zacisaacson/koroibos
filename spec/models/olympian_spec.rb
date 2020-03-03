require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :sex }
    it { should validate_presence_of :age }
    it { should validate_presence_of :height }
    it { should validate_presence_of :weight }
    it { should validate_presence_of :team }
  end

  describe "relationships" do
    it { should belong_to(:sport) }
    it { should have_many(:olympian_events) }
    it { should have_many(:events).through(:olympian_events) }
  end


  describe "instance methods" do
    it "total_medals_won" do
      soccer = create(:sport, name: "Soccer")
      world_cup = create(:event, name: "World Cup", sport_id: soccer.id)

      badminton = create(:sport, name: "Badminton")
      championship = create(:event, name: " Badminton Championship", sport_id: badminton.id)

      baseball = create(:sport, name: "Baseball")
      world_series = create(:event, name: "World Series", sport_id: baseball.id)

      olympian_1 = create(:olympian,
                          name: "Zac",
                          sex: "M",
                          age: 30,
                          height: 170,
                          weight: 175,
                          team: "Colorado Rapids",
                          sport_id: soccer.id)

      create(:olympian_event, medal: "Gold", olympian_id: olympian_1.id, event_id: world_cup.id)
      create(:olympian_event, medal: "Silver", olympian_id: olympian_1.id, event_id: championship.id)
      create(:olympian_event, medal: "NA", olympian_id: olympian_1.id, event_id: world_series.id)
      
      expect(olympian_1.total_medals_won).to eq(2)
    end
  end
end
