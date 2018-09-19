class Api::V1::UsersController < ApplicationController

  def index
    @relationships = Relationship.all
    render json: @relationships
  end

end
