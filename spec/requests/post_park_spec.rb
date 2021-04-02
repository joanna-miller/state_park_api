require 'rails_helper'

describe "post a park route", :type => :request do

  before do
    @state = FactoryBot.create(:state)
    park = Park.create!({name: 'A Really Cool Park', info: 'A beautiful park great for hiking and fishing', park_type: 'State Park', state_id: @state.id})
    get "/states/#{@state.id}/parks/#{park.id}"
  end

  it 'returns park' do
    expect(JSON.parse(response.body)['name']).to eq('A Really Cool Park')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns an error if park does not exist' do
    get "/states/#{@state.id}/parks/50"
    expect(JSON.parse(response.body)['message']).to eq("Couldn't find Park with 'id'=50")
  end
end