require 'rails_helper'

describe "Olympians API" do
  before (:each) do
    soccer = create(:sport, name: "Soccer")
    baseball = create(:sport, name: "Baseball")
    badminton = create(:sport, name: "Badminton")

    @olympian_1 = create(:olympian,
                        name: "Zac",
                        sex: "M",
                        age: 30,
                        height: 170,
                        weight: 175,
                        team: "Colorado Rockies",
                        sport_id: baseball.id)

   @olympian_2 = create(:olympian,
                        name: "Jackie",
                        sex: "F",
                        age: 28,
                        height: 120,
                        weight: 115,
                        team: "Colorado Rapids",
                        sport_id: soccer.id)

   @olympian_3 = create(:olympian,
                        name: "Jim",
                        sex: "M",
                        age: 26,
                        height: 190,
                        weight: 200,
                        team: "The Birdies",
                        sport_id: badminton.id)

   @olympian_4 = create(:olympian,
                        name: "Pam",
                        sex: "F",
                        age: 31,
                        height: 110,
                        weight: 100,
                        team: "USA",
                        sport_id: badminton.id)
  end

  it "shows olympian stats" do
    get '/api/v1/olympian_stats'

    expect(response).to be_successful

    stats = JSON.parse(response.body)

    expect(stats['olympian_stats']['total_competing_olympians']).to eq(4)
    expect(stats['olympian_stats']['average_weight']['unit']).to eq('kg')
    expect(stats['olympian_stats']['average_weight']['male_olympians']).to eq(187.5)
    expect(stats['olympian_stats']['average_weight']['female_olympians']).to eq(107.5)
    expect(stats['olympian_stats']['average_age']).to eq(28.8)
  end
end
