class StatesController < ApplicationController
  swagger_controller :states, "States in the USA"

  swagger_api :index do
    summary "Fetches all states"
    notes "This endpoint lists all the states that the API currently contains"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def index
    @states = State.all
    json_response(@states)
  end

  swagger_api :show do
    summary "Fetches a single state"
    notes "This endpoint fetches a single state by that states id."
    param :path, :id, :integer, :required, "State Id"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def show
    @state = State.find(params[:id])
    json_response(@state)
  end

  swagger_api :create do
    summary "Creates a new state"
    notes "This endpoint creates a new state"
    param :form, :name, :string, :required, "Name of State"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def create
    @state = State.create!(state_params)
    json_response(@state, :created)
  end

  swagger_api :update do
    summary "Updates an existing state."
    notes "This endpoint updates an existing state by name."
    param :path, :id, :integer, :required, "State Id"
    param :form, :name, :string, :required, "Updated Name"
    response :ok, "This state has been updated successfully."
    response :not_found
    response :unprocessable_entity, "Validation failed: Name cannot be blank"
  end
  def update
    @state = State.find(params[:id])
    if @state.update!(state_params)
      render status: 200, json: { message: "This state has been updated successfully." }
    end
  end

  swagger_api :destroy do
    summary "Deletes an existing state"
    notes "This endpoint deletes and existing state and all of the parks in it."
    param :path, :id, :integer, :required, "State id"
    response :ok, "This state has been deleted successfully."
    response :not_found
    response :unprocessable_entity
  end
  def destroy
    @state = State.find(params[:id])
    if @state.destroy!
      render status: 200, json: { message: "This state has been deleted successfully." }
    end
  end

  private
  def state_params
    params.permit(:name)
  end
end