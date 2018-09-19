class Api::V1::RelationshipsController < ApplicationController

  def index
    @relationships = Relationship.all
    render json: @relationships
  end

end
