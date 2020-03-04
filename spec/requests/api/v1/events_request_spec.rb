require 'rails_helper'

describe "Events API" do
  before (:each) do
    @soccer = create(:sport, name: "Soccer")
    @baseball = create(:sport, name: "Baseball")
    @badminton = create(:sport, name: "Badminton")

    @semi_final = create(:event, name: "Semi Final", sport_id: @soccer.id)
    @world_cup = create(:event, name: "World Cup", sport_id: @soccer.id)
    @world_series = create(:event, name: "World Cup", sport_id: @baseball.id)
    @badminton_championship = create(:event, name: "Badminton Championship", sport_id: @badminton.id)
  end

  it "shows all events" do
    get '/api/v1/events'

    expect(response).to be_successful

    events = JSON.parse(response.body)

    expect(events['events'][0]['sport']).to eq(@badminton.name)
    expect(events['events'][0]['events'].length).to eq(1)
  end

  it "shows medalists for a specific event" do
    olympian_1 = create(:olympian,
                        name: "Zac",
                        sex: "M",
                        age: 30,
                        height: 170,
                        weight: 175,
                        team: "Colorado Rockies",
                        sport_id: @soccer.id)

   olympian_2 = create(:olympian,
                        name: "Jackie",
                        sex: "F",
                        age: 28,
                        height: 120,
                        weight: 115,
                        team: "Colorado Rapids",
                        sport_id: @soccer.id)

   olympian_3 = create(:olympian,
                        name: "Jim",
                        sex: "M",
                        age: 26,
                        height: 190,
                        weight: 200,
                        team: "The Birdies",
                        sport_id: @soccer.id)

   olympian_4 = create(:olympian,
                        name: "Pam",
                        sex: "F",
                        age: 31,
                        height: 110,
                        weight: 100,
                        team: "USA",
                        sport_id: @soccer.id)

    create(:olympian_event, medal: "Gold", olympian_id: olympian_1.id, event_id: @world_cup.id)
    create(:olympian_event, medal: "Bronze", olympian_id: olympian_2.id, event_id: @world_cup.id)
    create(:olympian_event, medal: "Silver", olympian_id: olympian_3.id, event_id: @world_cup.id)
    create(:olympian_event, medal: "NA", olympian_id: olympian_4.id, event_id: @world_cup.id)

    get "/api/v1/events/#{@world_cup.id}/medalists"

    expect(response).to be_successful

    medalists = JSON.parse(response.body)

    expect(medalists['event']).to eq(@world_cup.name)
    expect(medalists['medalists'].length).to eq(3)
  end
end
