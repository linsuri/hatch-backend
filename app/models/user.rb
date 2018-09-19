class User < ApplicationRecord
  # validates :name, {presence: true, uniqueness: true}

  belongs_to :location
  has_many :active_relationships, class_name:  "Relationship",
                                foreign_key: "mentee_id",
                                dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                foreign_key: "mentor_id",
                                dependent:   :destroy
  has_many :mentors, through: :active_relationships
  has_many :mentees, through: :passive_relationships
end
