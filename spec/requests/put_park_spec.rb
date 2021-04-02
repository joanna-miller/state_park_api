require 'rails_helper'

describe "update a park route", :type => :request do

  before do
    @state = FactoryBot.create(:state)
    @park = Park.create!({name: 'A Really Cool Park', info: 'A beautiful park great for hiking and fishing', park_type: 'State Park', state_id: @state.id})
    put "/states/#{@state.id}/parks/#{@park.id}", params: { name: 'Updated Park', info: 'Updated Info', park_type: 'Updated Type' }
  end

  it 'updates the park name' do
    expect(Park.find(@park.id).name).to eq('Updated Park')
  end

  it 'updates the park info' do
    expect(Park.find(@park.id).info).to eq('Updated Info')
  end

  it 'updates the park type' do
    expect(Park.find(@park.id).park_type).to eq('Updated Type')
  end

  it 'returns an updated status' do
    expect(JSON.parse(response.body)['message']).to eq("This park has been updated successfully.")
  end
end