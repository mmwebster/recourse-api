# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# delete all old model instances, must delete child before parent associations
User.destroy_all
Course.destroy_all
DegreeMajor.destroy_all
DegreeMinor.destroy_all
School.destroy_all
Node.destroy_all
Quarter.destroy_all
Timeline.destroy_all

# instantiate new ones
school = School.create(title: 'University of California, Santa Cruz')
user = User.new email: "user@example.com", password: "password",
                name_first: "Plaborius", name_last: "Plumbus"
user.skip_confirmation!
user.save!

majors = []
majors << DegreeMajor.create(title: 'Robotics Engineering')
majors << DegreeMajor.create(title: 'Computer Engineering')
majors << DegreeMajor.create(title: 'Economics')

minors = []
minors << DegreeMinor.create(title: 'Computer Science Minor')
minors << DegreeMinor.create(title: 'Computer Engineering Minor')
minors << DegreeMinor.create(title: 'Economics Minor')

courses = []
courses << Course.create(title: 'Linear Algebra', subject: 'AMS', number: '10',
                       units: 5, season_fall: true, season_winter: true,
                       season_spring: false, total_units: 5)
courses << Course.create(title: 'Differential Equations', subject: 'AMS', number: '20',
                       units: 5, season_fall: false, season_winter: true,
                       season_spring: true, total_units: 5)
# courses << Course.create(title: 'Homogeneous Hogwash', subject: 'HHS', number: '25',
#                        units: 5, season_fall: false, season_winter: false,
#                        season_spring: true, total_units: 6)
# courses << Course.create(title: 'Math Malarkey', subject: 'MMA', number: '206',
#                        units: 5, season_fall: false, season_winter: true,
#                        season_spring: false, total_units: 10)
# courses << Course.create(title: 'Psychological Poppycock', subject: 'PSY', number: '666',
#                        units: 5, season_fall: true, season_winter: true,
#                        season_spring: true, total_units: 7)

# for now, avoiding STI and just going with optional fields in the Node model
nodes = []
nodes << Node.create(title: 'A goal node', node_type: 'goal',
                              node_goal_type: 'degree')
nodes << Node.create(title: 'A pivot node', node_type: 'course',
                     node_course_parent_rel: 'co', course: courses[1])
nodes << Node.create(title: 'A course node', node_type: 'course',
                                node_course_parent_rel: 'pre',
                                course: courses[0])
timeline = Timeline.create(starting_season: 'fall',
                           title: 'My Sweet College Plan')
timeline.quarters << Quarter.create(season: 'fall', max_units: 19,
                         start_date: Date.parse('27-9-2016'))
timeline.quarters << Quarter.create(season: 'winter', max_units: 19,
                         start_date: Date.parse('4-1-2017'))
timeline.quarters << Quarter.create(season: 'spring', max_units: 19,
                         start_date: Date.parse('28-3-2017'))

# hook up the relationships
school.courses << courses
school.users << user
school.degree_majors << majors
school.degree_minors << minors
# timeline.completed_courses << courses
timeline.courses << courses
# course[0].timeline = timeline
school.nodes << nodes
user.timelines << timeline
timeline.quarters[0].courses << courses[0]
timeline.quarters[1].courses << courses[0]
timeline.quarters[1].courses << courses[1]
timeline.quarters[2].courses << courses[1]
courses[0].concurrent_children << courses[1]
# courses[0].nodes << nodes[0]
# courses[0].nodes << nodes[1]
# courses[1].nodes << nodes[2]
