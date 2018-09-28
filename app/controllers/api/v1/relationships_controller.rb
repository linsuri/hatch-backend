class Api::V1::RelationshipsController < ApplicationController

  skip_before_action :authorized, only: [:index, :create, :update]

  def index
    @relationships = Relationship.all
    render json: @relationships
  end

  def create
    @relationship = Relationship.create(relationship_params)
    # @notification = Notification.create(sender_id: relationship_params[:mentee_id], recipient_id: relationship_params[:mentee_id], text: "sent mentorship request")
    @notification = Notification.create(sender_id: relationship_params[:mentee_id], recipient_id: relationship_params[:mentor_id], text: "mentorship request")
    if @relationship.valid?
      # serialized_data = ActiveModelSerializers::Adapter::Json.new(
      #   RelationshipSerializer.new(@relationship)
      # ).serializable_hash
      # ActionCable.server.broadcast 'notifications_channel', serialized_data
      # head :ok
      render json: { relationship: RelationshipSerializer.new(@relationship) }, status: :created
    else
      render json: { error: 'failed to create relationship' }, status: :not_acceptable
    end
  end

  def update
    byebug
    @relationship = Relationship.find_by(mentor_id: relationship_params[:mentor_id], mentee_id: relationship_params[:mentee_id])
    @relationship.update(accepted: relationship_params[:accepted])
    if @relationship.valid?
      render json: { relationship: RelationshipSerializer.update(@relationship) }, status: :patched
    else
      render json: { error: 'failed to update relationship' }, status: :not_acceptable
    end
  end

  def destroy

  end

  private
  def relationship_params
    params.require(:relationship).permit(:mentee_id, :mentor_id, :accepted)
  end

end
