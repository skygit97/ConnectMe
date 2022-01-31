# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')

sky = User.create!(
  first_name: 'Sky',
  last_name: 'Kumtong',
  email: 'skumtong@gmail.com',
  password: 'sky_password',
  birth_date: '1997-04-18',
  gender: 'Male'
)

demo = User.create!(
  first_name: 'Demo',
  last_name: 'User',
  email: 'demo_email@gmail.com',
  password: 'demo_password',
  birth_date: '1990-01-01',
  gender: 'Other'
)