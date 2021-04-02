require 'rails_helper'

describe "get all parks route", :type => :request do

  before do
    state = FactoryBot.create(:state)
    park = Park.create({name: 'A Really Cool Park', info: 'A beautiful park great for hiking and fishing', park_type: 'State Park', state_id: state.id})
    get "/states/#{state.id}/parks"
  end

  it 'returns all parks' do
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end