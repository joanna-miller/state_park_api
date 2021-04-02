require 'rails_helper'

describe "get state route", :type => :request do

  before do
    @state = FactoryBot.create(:state)
    get "/states/#{@state.id}"
  end

  it 'returns state' do
    expect(JSON.parse(response.body)['name']).to eq(@state.name)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns an error if state does not exist' do
    get "/states/50"
    expect(JSON.parse(response.body)['message']).to eq("Couldn't find State with 'id'=50")
  end
end