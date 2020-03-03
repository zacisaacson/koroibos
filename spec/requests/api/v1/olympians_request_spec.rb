require 'rails_helper'

describe "Olympians API" do
  it "sends a list of olympians" do
    soccer = create(:sport, name: "Soccer")
    baseball = create(:sport, name: "Baseball")
    badminton = create(:sport, name: "Badminton")

    olympian_1 = create(:olympian,
                        name: "Zac",
                        sex: "M",
                        age: 30,
                        height: 170,
                        weight: 175,
                        team: "Colorado Rockies",
                        sport_id: baseball.id)

    olympian_2 = create(:olympian,
                        name: "Jackie",
                        sex: "F",
                        age: 28,
                        height: 120,
                        weight: 115,
                        team: "Colorado Rapids",
                        sport_id: soccer.id)

    olympian_3 = create(:olympian,
                        name: "Jim",
                        sex: "M",
                        age: 26,
                        height: 190,
                        weight: 200,
                        team: "The Birdies",
                        sport_id: badminton.id)

    get '/api/v1/olympians'

    expect(response).to be_successful

    olympians = JSON.parse(response.body)

    expect(olympians['olympians'][0]['name']).to eq(olympian_1.name)
    expect(olympians['olympians'][0]['team']).to eq(olympian_1.team)
    expect(olympians['olympians'][0]['age']).to eq(olympian_1.age)
    expect(olympians['olympians'][0]['sport']).to eq(olympian_1.sport.name)
    expect(olympians['olympians'][0]['total_medals_won']).to eq(olympian_1.total_medals_won)

    expect(olympians['olympians'][2]['name']).to eq(olympian_3.name)
    expect(olympians['olympians'][2]['team']).to eq(olympian_3.team)
    expect(olympians['olympians'][2]['age']).to eq(olympian_3.age)
    expect(olympians['olympians'][2]['sport']).to eq(olympian_3.sport.name)
    expect(olympians['olympians'][2]['total_medals_won']).to eq(olympian_3.total_medals_won)

  end
end
