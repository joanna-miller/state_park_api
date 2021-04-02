class ParksController < ApplicationController

  def index
    state = State.find(params[:state_id])
    @parks = state.parks
    json_response(@parks)
  end

end