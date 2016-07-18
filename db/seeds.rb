# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# delete all old model instances
User.delete_all
Course.delete_all

# instantiate new ones
user = User.create(email: 'wilomebster@gmail.com', password: 'password')
course = Course.create(name: 'Test Course')
