# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# delete all old model instances, must delete child before parent associations
DegreeMajor.destroy_all
DegreeMinor.destroy_all
Timeline.destroy_all
Course.destroy_all
User.destroy_all
Student.destroy_all
Admin.destroy_all
School.destroy_all
Node.destroy_all
Quarter.destroy_all

# instantiate new ones
school = School.create(title: 'University of California, Santa Cruz')

user = User.new email: "user@example.com", password: "asdfasdf",
                name_first: "Plaborius", name_last: "Plumbus"
user.skip_confirmation!
user.save!

student = Student.new email: "student@example.com", password: "asdfasdf",
                      name_first: "Plaborius", name_last: "Plumbus"
student.skip_confirmation!
student.save!

admin = Admin.new email: "admin@example.com", password: "asdfasdf",
                  name_first: "Admanius", name_last: "Admin"
admin.skip_confirmation!
admin.save!

majors = []
majors << DegreeMajor.create(title: 'Robotics Engineering Major')
majors << DegreeMajor.create(title: 'Computer Engineering Major')
majors << DegreeMajor.create(title: 'Economics Major')
majors << DegreeMajor.create(title: 'Electrical Engineering Major')
majors << DegreeMajor.create(title: 'Technology and Information Management Major')
majors << DegreeMajor.create(title: 'A Major')
majors << DegreeMajor.create(title: 'B Major')
majors << DegreeMajor.create(title: 'C Major')
majors << DegreeMajor.create(title: 'D Major')
majors << DegreeMajor.create(title: 'E Major')
majors << DegreeMajor.create(title: 'F Major')

minors = []
minors << DegreeMinor.create(title: 'Computer Science Minor')
minors << DegreeMinor.create(title: 'Computer Engineering Minor')
minors << DegreeMinor.create(title: 'Economics Minor')

courses = []
courses << Course.create(title: 'Introduction to Classical Mechanics',
                         subject: 'PHYS', number: '5A',
                         units: 5, season_fall: true, season_winter: false,
                         season_spring: false, total_units: 5)
courses << Course.create(title: 'Linear Algebra', subject: 'AMS', number: '10',
                         units: 5, season_fall: true, season_winter: true,
                         season_spring: false, total_units: 5)
courses << Course.create(title: 'Differential Equations', subject: 'AMS',
                         number: '20',
                         units: 5, season_fall: false, season_winter: true,
                         season_spring: true, total_units: 5)
courses << Course.create(title: 'Introduction to Data Structures and Algorithms',
                         subject: 'CMPS', number: '101',
                         units: 5, season_fall: false, season_winter: true,
                         season_spring: true, total_units: 5)

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
                           title: 'My Sweet College Plan',
                           is_current: true)

timeline.quarters << Quarter.create(season: 'fall', max_units: 19,
                start_date: Date.parse('27-9-2016'))
timeline.quarters << Quarter.create(season: 'winter', max_units: 19,
                start_date: Date.parse('4-1-2017'))
timeline.quarters << Quarter.create(season: 'spring', max_units: 19,
                         start_date: Date.parse('28-3-2017'))

timeline.quarters << Quarter.create(season: 'fall', max_units: 19,
                         start_date: Date.parse('27-9-2017'))
timeline.quarters << Quarter.create(season: 'winter', max_units: 19,
                         start_date: Date.parse('5-1-2018'))
timeline.quarters << Quarter.create(season: 'spring', max_units: 19,
                         start_date: Date.parse('28-3-2018'))

timeline.quarters << Quarter.create(season: 'fall', max_units: 19,
                         start_date: Date.parse('27-9-2018'))
timeline.quarters << Quarter.create(season: 'winter', max_units: 19,
                         start_date: Date.parse('5-1-2019'))
timeline.quarters << Quarter.create(season: 'spring', max_units: 19,
                         start_date: Date.parse('28-3-2019'))

timeline.quarters << Quarter.create(season: 'fall', max_units: 19,
                         start_date: Date.parse('27-9-2019'))
timeline.quarters << Quarter.create(season: 'winter', max_units: 19,
                         start_date: Date.parse('5-1-2020'))
timeline.quarters << Quarter.create(season: 'spring', max_units: 19,
                         start_date: Date.parse('28-3-2020'))

# hook up the relationships
school.courses << courses
school.students << student
school.admins << admin
school.degree_majors << majors
school.degree_minors << minors
# timeline.completed_courses << courses
timeline.courses << courses
# course[0].timeline = timeline
school.nodes << nodes
student.timelines << timeline
timeline.quarters[0].courses << courses[0]
timeline.quarters[0].courses << courses[1]
timeline.quarters[1].courses << courses[2]
timeline.quarters[1].courses << courses[3]
courses[0].concurrent_children << courses[1]
# courses[0].nodes << nodes[0]
# courses[0].nodes << nodes[1]
# courses[1].nodes << nodes[2]
