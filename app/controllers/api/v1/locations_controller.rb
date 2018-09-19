class Api::V1::LocationsController < ApplicationController

  def index
    @locations = Relationship.all
    render json: @locations
  end

end
