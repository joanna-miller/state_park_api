require 'rails_helper'

describe "delete a park route", :type => :request do

  before do
    @state = FactoryBot.create(:state)
    @park = Park.create!({name: 'A Really Cool Park', info: 'A beautiful park great for hiking and fishing', park_type: 'State Park', state_id: @state.id})
    @park2 = Park.create!({name: 'An Even Cooler Park', info: 'A beautiful park great for hiking and fishing', park_type: 'National Park', state_id: @state.id})
  end

  it 'deletes park' do
    delete "/states/#{@state.id}/parks/#{@park.id}"
    expect(JSON.parse(response.body)['message']).to eq("This park has been deleted successfully.")
  end

  it 'deletes a park' do
    delete "/states/#{@state.id}/parks/#{@park.id}"
    get "/states/#{@state.id}/parks"
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it 'returns an error for park that does not exist' do
    delete "/states/#{@state.id}/parks/50"
    expect(JSON.parse(response.body)['message']).to eq("Couldn't find Park with 'id'=50")
  end

end