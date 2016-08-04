# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# delete all old model instances
# User.delete_all
School.delete_all
User.delete_all
Node.delete_all
Course.delete_all
Quarter.delete_all
Timeline.delete_all

# instantiate new ones
school = School.create(title: 'University of California, Santa Cruz')
user = User.create(name_first: 'Wilo', name_last: 'Mebster',
                   email: 'wilomebster@gmail.com')
# for now, avoiding STI and just going with optional fields in the Node model
node_goal = Node.create(title: 'A goal node', node_type: 'goal',
                            node_goal_type: 'degree')
node_pivot = Node.create(title: 'A pivot node', node_type: 'pivot')
node_course = Node.create(title: 'A course node', node_type: 'course',
                                node_course_parent_rel: 'pre')
course = Course.create(title: 'Test Course', subject: 'AMS', number: '10',
                       units: 5, season_fall: true, season_winter: true,
                       season_spring: false, total_units: 5)
quarter = Quarter.create(season: 'fall', max_units: 19)
timeline = Timeline.create(starting_season: 'fall', title: 'My Sweet College Plan')
