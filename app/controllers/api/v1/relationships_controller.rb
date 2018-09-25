class Api::V1::RelationshipsController < ApplicationController

  skip_before_action :authorized, only: [:index, :create]

  def index
    @relationships = Relationship.all
    render json: @relationships
  end

  def create
    @relationship = Relationship.create(relationship_params)
    if @relationship.valid?
      render json: { relationship: RelationshipSerializer.new(@relationship) }, status: :created
    else
      render json: { error: 'failed to create relationship' }, status: :not_acceptable
    end
  end

  private
  def relationship_params
    params.require(:user).permit(:mentee_id, :mentor_id)
  end

end
