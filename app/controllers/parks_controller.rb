class ParksController < ApplicationController

  def index
    state = State.find(params[:state_id])
    @parks = state.parks
    json_response(@parks)
  end

  def show
    @state = State.find(params[:state_id])
    @park = Park.find(params[:id])
    if @park.state_id == @state.id
      json_response(@park)
    end
  end

  def create
    @park = Park.create!(park_params)
    json_response(@park, :created)
  end

  def park_params
    params.permit(:name, :info, :park_type, :state_id)
  end
end