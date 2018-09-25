class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :conversation_id, :text, :created_at

  belongs_to :conversation
  belongs_to :user
end
