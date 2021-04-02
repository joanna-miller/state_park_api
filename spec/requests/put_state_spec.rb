require 'rails_helper'

describe "update a state route", :type => :request do

  before do
    @state = FactoryBot.create(:state)
    put "/states/#{@state.id}", params: { name: 'Updated State' }
  end

  it 'updates the state name' do
    expect(State.find(@state.id).name).to eq('Updated State')
  end

end