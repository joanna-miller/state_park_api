class ParksController < ApplicationController
  swagger_controller :parks, "State and National Parks"

  swagger_api :index do
    summary "Fetches all parks for specific state"
    notes "This endpoint lists all the State and National parks for a specific state"
    param :path, :state_id, :integer, :required, "State Id"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
  end
  def index
    state = State.find(params[:state_id])
    @parks = state.parks
    json_response(@parks)
  end

  swagger_api :show do
    summary "Fetches a single park for a state"
    notes "This endpoint returns a single park"
    param :path, :state_id, :integer, :required, "State Id"
    param :path, :id, :integer, :required, "Park Id"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity, "A park with that id does not match the state id."
  end
  def show
    @state = State.find(params[:state_id])
    @park = Park.find(params[:id])
    if @park.state_id == @state.id
      json_response(@park)      
    else
      render status: 404, json: { message: "A park with that id does not match the state id." }
    end
  end

  swagger_api :create do
    summary "Creates a new park"
    notes "This endpoint creates a new park within a state"
    param :path, :state_id, :integer, :required, "State Id"
    param :form, :name, :string, :required, "Name of Park"
    param :form, :info, :text, :required, "Park Info"
    param :form, :park_type, :string, :required, "Type of Park"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def create
    @park = Park.create!(park_params)
    json_response(@park, :created)
  end

  swagger_api :update do
    summary "Updates an existing park"
    notes "This endpoint updates an existing park with new details"
    param :path, :state_id, :integer, :required, "State Id"
    param :form, :name, :string, :optional, "Name of Park"
    param :form, :info, :text, :optional, "Park Info"
    param :form, :park_type, :string, :optional, "Type of Park"
    response :ok, "This park has been updated successfully."
    response :not_found
    response :unprocessable_entity
  end
  def update 
    @park = Park.find(params[:id])
    if @park.update!(park_params)
      render status: 200, json: {
        message: "This park has been updated successfully."
      }
    end
  end

  swagger_api :destroy do
    summary "Deletes an existing park"
    notes "This endpoint deletes an existing park"
    param :path, :state_id, :integer, :required, "State Id"
    param :path, :id, :integer, :required, "Park Id"
    response :ok, "This park has been deleted successfully."
    response :not_found
    response :unprocessable_entity
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