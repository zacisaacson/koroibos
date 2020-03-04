require 'rails_helper'

describe "Events API" do
  before (:each) do
    @soccer = create(:sport, name: "Soccer")
    @baseball = create(:sport, name: "Baseball")
    @badminton = create(:sport, name: "Badminton")

    semi_final = create(:event, name: "Semi Final", sport_id: @soccer.id)
    world_cup = create(:event, name: "World Cup", sport_id: @soccer.id)
    world_series = create(:event, name: "World Cup", sport_id: @baseball.id)
    badminton_championship = create(:event, name: "Badminton Championship", sport_id: @badminton.id)
  end

  it "shows all events" do
    get '/api/v1/events'

    expect(response).to be_successful

    events = JSON.parse(response.body)

    expect(events['events'][0]['sport']).to eq(@badminton.name)
    expect(events['events'][0]['events'].length).to eq(1)

  end
end
