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

  def update 
    @park = Park.find(params[:id])
    if @park.update!(park_params)
      render status: 200, json: {
        message: "This park has been updated successfully."
      }
    end
  end

  def destroy
    @park = Park.find(params[:id])
    if @park.destroy!
      render status: 200, json: {
        message: "This park has been deleted successfully."
      }
    end
  end

  def park_params
    params.permit(:name, :info, :park_type, :state_id)
  end
end