require 'pry'
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
Student.destroy_all
Admin.destroy_all
User.destroy_all # incase the user's type is accidentally overwritten..
School.destroy_all
Node.destroy_all
Quarter.destroy_all

# instantiate new ones
school = School.create(title: 'University of California, Santa Cruz')

student = Student.new email: "student@example.com", password: "asdfasdf",
                      name_first: "Plaborius", name_last: "Plumbus"
student.skip_confirmation!
student.save!

admin = Admin.new email: "admin@example.com", password: "asdfasdf",
                  name_first: "Adminius", name_last: "Admin"
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

# MATH
courses << Course.create(title: 'Linear Algebra', subject: 'AMS', number: '10', units: 5, season_fall: true, season_winter: true, season_spring: false, total_units: 5)
courses << Course.create(title: 'Differential Equations', subject: 'AMS', number: '20', units: 5, season_fall: false, season_winter: true, season_spring: true, total_units: 5)
courses << Course.create(title: 'Calculus I', subject: 'MATH', number: '19A', units: 5, season_fall: true, season_winter: true, season_spring: true)
courses << Course.create(title: 'Calculus II', subject: 'MATH', number: '19B', units: 5, season_fall: true, season_winter: true, season_spring: true)
courses << Course.create(title: 'Vector Calculus', subject: 'MATH', number: '23A', units: 5, season_fall: true, season_winter: true, season_spring: true)

# EE
courses << Course.create(title: 'Signals & Systems', subject: 'EE', number: '103/L', units: 7, season_fall: true, season_winter: false, season_spring: true)
courses << Course.create(title: 'Electronic Circuits', subject: 'EE', number: '101/L', units: 7, season_fall: true, season_winter: true, season_spring: false)

# CMPE
courses << Course.create(title: 'Discrete Math', subject: 'CMPE', number: '16', units: 5, season_fall: true, season_winter: true, season_spring: true)
courses << Course.create(title: 'Probability & Statistics', subject: 'CMPE', number: '107', units: 5, season_fall: false, season_winter: true, season_spring: true)
courses << Course.create(title: 'Computer Systems & Assembly Language', subject: 'CMPE', number: '12/L', units: 7, season_fall: true, season_winter: true, season_spring: true)
courses << Course.create(title: 'Computer Systems & C Programming', subject: 'CMPE', number: '13/L', units: 7, season_fall: false, season_winter: true, season_spring: true)
courses << Course.create(title: 'Statics, Dynamics, & Biomechanics', subject: 'CMPE', number: '9', units: 5, season_fall: false, season_winter: true, season_spring: false)
courses << Course.create(title: 'Solid Mechanics', subject: 'CMPE', number: '115', units: 5, season_fall: false, season_winter: false, season_spring: true)
courses << Course.create(title: 'Logic Design', subject: 'CMPE', number: '100/L', units: 7, season_fall: false, season_winter: true, season_spring: true)
courses << Course.create(title: 'Microprocessor System Design', subject: 'CMPE', number: '121/L', units: 7, season_fall: true, season_winter: false, season_spring: true)
courses << Course.create(title: 'Intro to Mechatronics', subject: 'CMPE', number: '118/L', units: 7, season_fall: true, season_winter: false, season_spring: false)
courses << Course.create(title: 'Feedback Control Systems', subject: 'CMPE', number: '141', units: 5, season_fall: true, season_winter: false, season_spring: false)
courses << Course.create(title: 'Sensing & Sensor Technologies', subject: 'CMPE', number: '167/L', units: 7, season_fall: false, season_winter: true, season_spring: false)
courses << Course.create(title: 'Technical Writing', subject: 'CMPE', number: '185', units: 5, season_fall: true, season_winter: true, season_spring: true)
courses << Course.create(title: 'Capstone Project I', subject: 'CMPE', number: '129A', units: 2, season_fall: true, season_winter: false, season_spring: false)
courses << Course.create(title: 'Capstone Project II', subject: 'CMPE', number: '129B', units: 5, season_fall: false, season_winter: true, season_spring: false)
courses << Course.create(title: 'Capstone Project III', subject: 'CMPE', number: '129C', units: 5, season_fall: false, season_winter: false, season_spring: true)

# CS
courses << Course.create(title: 'Data Structures', subject: 'CMPS', number: '12B/M', units: 7, season_fall: true, season_winter: true, season_spring: true)
courses << Course.create(title: 'Abstract Data Types & Algorithms', subject: 'CMPS', number: '101', units: 5, season_fall: false, season_winter: true, season_spring: true, total_units: 5)

# PHYS
courses << Course.create(title: 'Classical Mechanics', subject: 'PHYS', number: '5A', units: 5, season_fall: true, season_winter: false, season_spring: false, total_units: 5)
courses << Course.create(title: 'Electricity & Magnetism', subject: 'PHYS', number: '5C/N', units: 7, season_fall: false, season_winter: false, season_spring: true)

# NOTE: robo courses not including the "Advanced Robotics Elective" courses




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
student.courses << courses[0]
timeline.quarters[0].courses << courses[0]
timeline.quarters[0].courses << courses[1]
timeline.quarters[1].courses << courses[2]
timeline.quarters[1].courses << courses[3]
courses[0].concurrent_children << courses[1]
# courses[0].nodes << nodes[0]
# courses[0].nodes << nodes[1]
# courses[1].nodes << nodes[2]
