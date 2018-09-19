class UserSerializer < ActiveModel::Serializer
  belongs_to :location
  # has_many :active_relationships, class_name:  "Relationship",
  #                               foreign_key: "mentee_id",
  #                               dependent:   :destroy
  # has_many :passive_relationships, class_name:  "Relationship",
  #                               foreign_key: "mentor_id",
  #                               dependent:   :destroy
  has_many :mentors, through: :active_relationships
  has_many :mentees, through: :passive_relationships

  attributes :id, :first_name, :last_name, :email_address, :profile_pic, :job_title, :expertise, :bio, :linkedin, :github, :personal_website, :will_buy_coffee
end