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

majors = [
  DegreeMajor.new(title: "Computer Engineering Major", user_id: nil, tree: {"type"=>"root", "children"=>[]}),
  DegreeMajor.new(title: "Economics Major", user_id: nil, tree: {"type"=>"root", "children"=>[]}),
  DegreeMajor.new(title: "Electrical Engineering Major", user_id: nil, tree: {"type"=>"root", "children"=>[]}),
  DegreeMajor.new(title: "Technology and Information Management Major", user_id: nil, tree: {"type"=>"root", "children"=>[]}),
  DegreeMajor.new(title: "A Major", user_id: nil, tree: {"type"=>"root", "children"=>[]}),
  DegreeMajor.new(title: "B Major", user_id: nil, tree: {"type"=>"root", "children"=>[]}),
  DegreeMajor.new(title: "C Major", user_id: nil, tree: {"type"=>"root", "children"=>[]}),
  DegreeMajor.new(title: "D Major", user_id: nil, tree: {"type"=>"root", "children"=>[]}),
  DegreeMajor.new(title: "E Major", user_id: nil, tree: {"type"=>"root", "children"=>[]}),
  DegreeMajor.new(title: "F Major", user_id: nil, tree: {"type"=>"root", "children"=>[]}),
  DegreeMajor.new(title: "Robotics Engineering Major", user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"CMPE", "number"=>"129C", "parentRel"=>"pre", "id"=>809}, {"type"=>"course", "children"=>[], "id"=>806, "subject"=>"CMPE", "number"=>"167/L", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>805, "subject"=>"CMPE", "number"=>"141", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>801, "subject"=>"CMPE", "number"=>"118/L", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>798, "subject"=>"CMPE", "number"=>"115", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>791, "subject"=>"CMPE", "number"=>"107", "parentRel"=>"pre"}], "numChildrenRequired"=>1})
]

minors = []
minors << DegreeMinor.create(title: 'Computer Science Minor')
minors << DegreeMinor.create(title: 'Computer Engineering Minor')
minors << DegreeMinor.create(title: 'Economics Minor')

courses = [
  Course.new(subject: "AMS", number: "10", title: "Linear Algebra", units: "5.0", season_fall: true, season_winter: true, season_spring: false, total_units: "5.0", node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[], "numChildrenRequired"=>1}),
  Course.new(subject: "CMPE", number: "118/L", title: "Intro to Mechatronics", units: "7.0", season_fall: true, season_winter: false, season_spring: false, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "id"=>792, "subject"=>"EE", "number"=>"101/L", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>802, "subject"=>"CMPE", "number"=>"100/L", "parentRel"=>"pre"}], "numChildrenRequired"=>"2"}),
  Course.new(subject: "CMPS", number: "101", title: "Abstract Data Types & Algorithms", units: "5.0", season_fall: false, season_winter: true, season_spring: true, total_units: "5.0", node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"CMPS", "number"=>"12B/M", "parentRel"=>"pre", "id"=>793}, {"type"=>"course", "children"=>[], "id"=>790, "subject"=>"CMPE", "number"=>"16", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>794, "subject"=>"MATH", "number"=>"19B", "parentRel"=>"pre"}, {"type"=>"pivot", "children"=>[{"type"=>"course", "children"=>[], "id"=>795, "subject"=>"MATH", "number"=>"23A", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>787, "subject"=>"AMS", "number"=>"10", "parentRel"=>"pre"}], "numChildrenRequired"=>1, "title"=>"Upper Math Req"}], "numChildrenRequired"=>"4"}),
  Course.new(subject: "CMPE", number: "129B", title: "Capstone Project II", units: "5.0", season_fall: false, season_winter: true, season_spring: false, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"CMPE", "number"=>"129A", "parentRel"=>"pre", "id"=>807}], "numChildrenRequired"=>1}),
  Course.new(subject: "CMPE", number: "100/L", title: "Logic Design", units: "7.0", season_fall: false, season_winter: true, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"CMPE", "number"=>"12/L", "parentRel"=>"pre", "id"=>789}], "numChildrenRequired"=>1}),
  Course.new(subject: "MATH", number: "19A", title: "Calculus I", units: "5.0", season_fall: true, season_winter: true, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: 787, user_id: nil, tree: {"type"=>"root", "children"=>[], "numChildrenRequired"=>1}),
  Course.new(subject: "CMPE", number: "12/L", title: "Computer Systems & Assembly Language", units: "7.0", season_fall: true, season_winter: true, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[], "numChildrenRequired"=>1}),
  Course.new(subject: "CMPE", number: "16", title: "Discrete Math", units: "5.0", season_fall: true, season_winter: true, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"MATH", "number"=>"19A", "parentRel"=>"pre", "id"=>788}], "numChildrenRequired"=>1}),
  Course.new(subject: "CMPE", number: "107", title: "Probability & Statistics", units: "5.0", season_fall: false, season_winter: true, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "id"=>790, "subject"=>"CMPE", "number"=>"16", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>795, "subject"=>"MATH", "number"=>"23A", "parentRel"=>"pre"}], "numChildrenRequired"=>"2"}),
  Course.new(subject: "EE", number: "101/L", title: "Electronic Circuits", units: "7.0", season_fall: true, season_winter: true, season_spring: false, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"PHYS", "number"=>"5C/N", "parentRel"=>"pre", "id"=>812}, {"type"=>"course", "children"=>[], "id"=>800, "subject"=>"AMS", "number"=>"20", "parentRel"=>"co"}], "numChildrenRequired"=>"2"}),
  Course.new(subject: "CMPS", number: "12B/M", title: "Data Structures", units: "7.0", season_fall: true, season_winter: true, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"CMPE", "number"=>"13/L", "parentRel"=>"pre", "id"=>797}], "numChildrenRequired"=>1}),
  Course.new(subject: "MATH", number: "19B", title: "Calculus II", units: "5.0", season_fall: true, season_winter: true, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"MATH", "number"=>"19A", "parentRel"=>"pre", "id"=>788}], "numChildrenRequired"=>1}),
  Course.new(subject: "MATH", number: "23A", title: "Vector Calculus", units: "5.0", season_fall: true, season_winter: true, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"MATH", "number"=>"19B", "parentRel"=>"pre", "id"=>794}], "numChildrenRequired"=>1}),
  Course.new(subject: "CMPE", number: "13/L", title: "Computer Systems & C Programming", units: "7.0", season_fall: false, season_winter: true, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"CMPE", "number"=>"13/L", "parentRel"=>"pre", "id"=>797}], "numChildrenRequired"=>1}),
  Course.new(subject: "CMPE", number: "115", title: "Solid Mechanics", units: "5.0", season_fall: false, season_winter: false, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "id"=>804, "subject"=>"CMPE", "number"=>"9", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>794, "subject"=>"MATH", "number"=>"19B", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>787, "subject"=>"AMS", "number"=>"10", "parentRel"=>"pre"}], "numChildrenRequired"=>"3"}),
  Course.new(subject: "EE", number: "103/L", title: "Signals & Systems", units: "7.0", season_fall: true, season_winter: false, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "id"=>792, "subject"=>"EE", "number"=>"101/L", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>800, "subject"=>"AMS", "number"=>"20", "parentRel"=>"pre"}], "numChildrenRequired"=>"2"}),
  Course.new(subject: "AMS", number: "20", title: "Differential Equations", units: "5.0", season_fall: false, season_winter: true, season_spring: true, total_units: "5.0", node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: 760, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"MATH", "number"=>"19B", "parentRel"=>"pre", "id"=>794}, {"type"=>"course", "children"=>[], "id"=>800, "subject"=>"AMS", "number"=>"20", "parentRel"=>"pre"}], "numChildrenRequired"=>"2"}),
  Course.new(subject: "CMPE", number: "9", title: "Statics, Dynamics, & Biomechanics", units: "5.0", season_fall: false, season_winter: true, season_spring: false, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "id"=>788, "subject"=>"MATH", "number"=>"19A", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>811, "subject"=>"PHYS", "number"=>"5A/L", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>787, "subject"=>"AMS", "number"=>"10", "parentRel"=>"pre"}], "numChildrenRequired"=>"3"}),
  Course.new(subject: "CMPE", number: "141", title: "Feedback Control Systems", units: "5.0", season_fall: true, season_winter: false, season_spring: false, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"EE", "number"=>"103/L", "parentRel"=>"pre", "id"=>799}], "numChildrenRequired"=>1}),
  Course.new(subject: "CMPE", number: "167/L", title: "Sensing & Sensor Technologies", units: "7.0", season_fall: false, season_winter: true, season_spring: false, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "id"=>797, "subject"=>"CMPE", "number"=>"13/L", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>799, "subject"=>"EE", "number"=>"103/L", "parentRel"=>"pre"}], "numChildrenRequired"=>"2"}),
  Course.new(subject: "CMPE", number: "129A", title: "Capstone Project I", units: "2.0", season_fall: true, season_winter: false, season_spring: false, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"CMPE", "number"=>"121/L", "parentRel"=>"co", "id"=>803}], "numChildrenRequired"=>1}),
  Course.new(subject: "CMPE", number: "185", title: "Technical Writing", units: "5.0", season_fall: true, season_winter: true, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "id"=>793, "subject"=>"CMPS", "number"=>"12B/M", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>789, "subject"=>"CMPE", "number"=>"12/L", "parentRel"=>"pre"}], "numChildrenRequired"=>"1"}),
  Course.new(subject: "CMPE", number: "129C", title: "Capstone Project III", units: "5.0", season_fall: false, season_winter: false, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"CMPE", "number"=>"129B", "parentRel"=>"pre", "id"=>810}], "numChildrenRequired"=>1}),
  Course.new(subject: "CMPE", number: "121/L", title: "Microprocessor System Design", units: "7.0", season_fall: true, season_winter: false, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "id"=>802, "subject"=>"CMPE", "number"=>"100/L", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>792, "subject"=>"EE", "number"=>"101/L", "parentRel"=>"pre"}, {"type"=>"pivot", "children"=>[{"type"=>"course", "children"=>[], "id"=>797, "subject"=>"CMPE", "number"=>"13/L", "parentRel"=>"pre"}, {"type"=>"course", "children"=>[], "id"=>793, "subject"=>"CMPS", "number"=>"12B/M", "parentRel"=>"pre"}], "numChildrenRequired"=>1, "title"=>"CS Req"}], "numChildrenRequired"=>"3"}),
  Course.new(subject: "PHYS", number: "5A/L", title: "Classical Mechanics", units: "5.0", season_fall: true, season_winter: false, season_spring: false, total_units: "5.0", node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"MATH", "number"=>"19A", "parentRel"=>"co", "id"=>788}], "numChildrenRequired"=>1}),
  Course.new(subject: "PHYS", number: "5C/N", title: "Electricity & Magnetism", units: "7.0", season_fall: false, season_winter: false, season_spring: true, total_units: nil, node_id: nil, quarter_id: nil, timeline_id: nil, concurrent_parent_id: nil, user_id: nil, tree: {"type"=>"root", "children"=>[{"type"=>"course", "children"=>[], "subject"=>"PHYS", "number"=>"5A/L", "parentRel"=>"pre", "id"=>811}, {"type"=>"course", "children"=>[], "id"=>794, "subject"=>"MATH", "number"=>"19B", "parentRel"=>"pre"}], "numChildrenRequired"=>"2"})
]

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
