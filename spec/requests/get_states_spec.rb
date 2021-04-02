require 'rails_helper'

describe "get all states route", :type => :request do
  let!(:states) { FactoryBot.create_list(:state, 20)}

  before { get '/states'}

  it 'returns all states' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

end