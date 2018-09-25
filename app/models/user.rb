class User < ApplicationRecord
  has_secure_password
  validates :email_address, {presence: true, uniqueness: true}
  validates :password_digest, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  belongs_to :location
  
  has_many :active_relationships, class_name:  "Relationship",
                                foreign_key: "mentee_id",
                                dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                foreign_key: "mentor_id",
                                dependent:   :destroy
  has_many :mentors, through: :active_relationships
  has_many :mentees, through: :passive_relationships

  has_many :messages
  has_many :conversations, through: :messages
end
