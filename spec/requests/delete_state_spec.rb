require 'rails_helper'

describe "delete a state route", :type => :request do

  before do
    @state = FactoryBot.create(:state)
    @state2 = FactoryBot.create(:state)
  end

  it 'deletes state' do
    delete "/states/#{@state.id}"
    expect(JSON.parse(response.body)['message']).to eq("This state has been deleted successfully.")
  end

  it 'deletes a state' do
    delete "/states/#{@state.id}"
    get "/states"
    expect(JSON.parse(response.body).size).to eq(1)
  end
end