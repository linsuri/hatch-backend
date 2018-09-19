# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
newyork = Location.create({
  city: 'New York',
  state: 'NY',
  country: 'USA',
  })

amysantiago = User.create(
  first_name: 'Amy',
  last_name: 'Santiago',
  email_address: 'amy.santiago@b99.org',
  profile_pic: '',
  job_title: 'detective',
  expertise: 'homicide,robberies,terrorism,management',
  bio: 'I am a detective at Precinct 99 in Brooklyn, NY.',
  linkedin: 'https://linkedin.com/en/amysantiago',
  github: '',
  personal_website: '',
  will_buy_coffee: true,
  location_id: 1,
  )

raymondholt = User.create(
  first_name: 'Raymond',
  last_name: 'Holt',
  email_address: 'raymond.holt@b99.org',
  profile_pic: '',
  job_title: 'captain',
  expertise: 'management',
  bio: 'I am a captain, who is running Precinct 99 in Brooklyn, NY.',
  linkedin: 'https://linkedin.com/en/raymondholt',
  github: '',
  personal_website: '',
  will_buy_coffee: false,
  location_id: 1,
)

Relationship.create(
  mentee_id: 1,
  mentor_id: 2,
  accepted: true,
)
