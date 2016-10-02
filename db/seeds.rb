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
# Course.destroy_all # Now done in if block with scraped data
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
# Courses now seeded at bottom using scraped data
# courses << Course.create(title: 'Introduction to Classical Mechanics',
#                          subject: 'PHYS', number: '5A',
#                          units: 5, season_fall: true, season_winter: false,
#                          season_spring: false, total_units: 5,
#                          tree: {
#                            type: 'root',
#                            title: 'Some node',
#                            children: [
#                              {
#                                title: 'Some nested node',
#                                type: 'pivot',
#                                children: [],
#                              },
#                              {
#                                type: 'course',
#                                title: 'Another nested node',
#                              }
#                            ]
#                          })
# courses << Course.create(title: 'Linear Algebra', subject: 'AMS', number: '10',
#                          units: 5, season_fall: true, season_winter: true,
#                          season_spring: false, total_units: 5)
# courses << Course.create(title: 'Differential Equations', subject: 'AMS',
#                          number: '20',
#                          units: 5, season_fall: false, season_winter: true,
#                          season_spring: true, total_units: 5)
# courses << Course.create(title: 'Introduction to Data Structures and Algorithms',
#                          subject: 'CMPS', number: '101',
#                          units: 5, season_fall: false, season_winter: true,
#                          season_spring: true, total_units: 5)

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

reload_courses = true

if reload_courses

  Course.destroy_all

  courses = []

  courses << Course.create(title: 'Pre-Statistics', subject: 'AMS', number: '2', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Precalculus for Science and Engineering', subject: 'AMS', number: '3', units: 5, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Statistics', subject: 'AMS', number: '5', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Precalculus for Statistics', subject: 'AMS', number: '6', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Statistical Methods for the Biological, Environmental, and Health Sciences', subject: 'AMS', number: '7', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Statistical Methods for the Biological, Environmental, and Health Sciences Laboratory', subject: 'AMS', number: '7l', units: 2, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Mathematical Methods for Engineers I', subject: 'AMS', number: '10', units: 5, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Basic Mathematical Methods for Engineers I', subject: 'AMS', number: '10a', units: 3, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Mathematical Methods for Engineers IB', subject: 'AMS', number: '10b', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Mathematical Methods for Economists I', subject: 'AMS', number: '11a', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Mathematical Methods for Economists II', subject: 'AMS', number: '11b', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Case-Study Calculus I', subject: 'AMS', number: '15a', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Case-Study Calculus II', subject: 'AMS', number: '15b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Mathematical Methods for Engineers II', subject: 'AMS', number: '20', units: 5, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Basic Mathematical Methods for Engineers II', subject: 'AMS', number: '20a', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Mathematical Methods for Engineers IIB', subject: 'AMS', number: '20b', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Mathematical Methods for Engineers', subject: 'AMS', number: '27', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Mathematical Methods for Engineers Laboratory', subject: 'AMS', number: '27l', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Gambling and Gaming', subject: 'AMS', number: '80a', units: 5, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'The Art of Data Visualization', subject: 'AMS', number: '80b', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Mathematical Methods for Engineers III', subject: 'AMS', number: '100', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Fluid Dynamics', subject: 'AMS', number: '107', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Managerial Statistics', subject: 'AMS', number: '113', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Dynamical Systems', subject: 'AMS', number: '114', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Stochastic Modeling in Biology', subject: 'AMS', number: '115', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Estimation and Introduction to Control of Stochastic Processes', subject: 'AMS', number: '118', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Probability Theory', subject: 'AMS', number: '131', units: 5, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Classical and Bayesian Inference', subject: 'AMS', number: '132', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Introduction to Dynamical Systems', subject: 'AMS', number: '146', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computational Methods and Applications', subject: 'AMS', number: '147', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'New Course in Development', subject: 'AMS', number: '148', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Linear Regression', subject: 'AMS', number: '156', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Design and Analysis of Computer Simulation Experiments', subject: 'AMS', number: '162', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Study or Research', subject: 'AMS', number: '198', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Study or Research', subject: 'AMS', number: '198f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Research and Teaching in AMS', subject: 'AMS', number: '200', units: 3, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Linear Models in SAS', subject: 'AMS', number: '202', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction of Probability Theory', subject: 'AMS', number: '203', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Mathematical Statistics', subject: 'AMS', number: '205', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Mathematical Statistics', subject: 'AMS', number: '205a', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Intermediate Classical Inference', subject: 'AMS', number: '205b', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Classical and Bayesian Inference', subject: 'AMS', number: '206', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Intermediate Bayesian Inference', subject: 'AMS', number: '206b', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Intermediate Bayesian Statistical Modeling', subject: 'AMS', number: '207', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Foundations of Scientific Computing', subject: 'AMS', number: '209', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Mathematical Models', subject: 'AMS', number: '210', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Foundations of Applied Mathematics', subject: 'AMS', number: '211', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Applied Mathematical Methods I', subject: 'AMS', number: '212a', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Applied Mathematical Methods II', subject: 'AMS', number: '212b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Numerical Solutions of Differential Equations', subject: 'AMS', number: '213', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Numerical Linear Algebra', subject: 'AMS', number: '213a', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Numerical Methods for the Solution of Differential equations', subject: 'AMS', number: '213b', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Applied Dynamical Systems', subject: 'AMS', number: '214', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Stochastic Modeling in Biology', subject: 'AMS', number: '215', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Stochastic Differential Equations', subject: 'AMS', number: '216', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Fluid Dynamics', subject: 'AMS', number: '217', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Estimation and Introduction to Control of Stochastic Processes', subject: 'AMS', number: '218', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Bayesian Decision Theory', subject: 'AMS', number: '221', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Time Series Analysis', subject: 'AMS', number: '223', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Multivariate Statistical Methods', subject: 'AMS', number: '225', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Waves and Instabilities in Fluids', subject: 'AMS', number: '227', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Nonlinear Control Theory', subject: 'AMS', number: '231', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Applied Optimal Control', subject: 'AMS', number: '232', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Motion Coordination of Robotic Networks', subject: 'AMS', number: '236', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Fundamentals of Uncertainty Quantification in Computational Science and Engineering', subject: 'AMS', number: '238', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Bayesian Nonparametric Methods', subject: 'AMS', number: '241', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Spatial Statistics', subject: 'AMS', number: '245', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'An Introduction to High Performance Computing', subject: 'AMS', number: '250', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Linear Statistical Models', subject: 'AMS', number: '256', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computational Fluid Dynamics', subject: 'AMS', number: '260', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Probability Theory with Markov Chains', subject: 'AMS', number: '261', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Stochastic Processes', subject: 'AMS', number: '263', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Advanced Bayesian Computation', subject: 'AMS', number: '268', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Generalized Linear Models', subject: 'AMS', number: '274', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Magnetohydrodynamics', subject: 'AMS', number: '275', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Bayesian Survival Analysis and Clinical Trial Design', subject: 'AMS', number: '276', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Seminar in Mathematical and Computational Biology', subject: 'AMS', number: '280a', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminars in Statistical and Applied Mathematical Modeling', subject: 'AMS', number: '280b', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar in Geophysical & Astrophysical Fluid Dynamics', subject: 'AMS', number: '280c', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar in Bayesian Statistical Methodology', subject: 'AMS', number: '280d', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar in Career Skills', subject: 'AMS', number: '285', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Topics in Mathematical and Computational Biology', subject: 'AMS', number: '290a', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Topics in the Numerical Solution of PDEs', subject: 'AMS', number: '290b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Topics in Bayesian Statistics', subject: 'AMS', number: '291', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Masters Project', subject: 'AMS', number: '296', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Study or Research', subject: 'AMS', number: '297', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Study', subject: 'AMS', number: '297f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Thesis Research', subject: 'AMS', number: '299', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Biotechnology', subject: 'BME', number: '5', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Applied Electronics for Bioengineers part 1', subject: 'BME', number: '51a', units: 4, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Applied Electronics for Bioengineers part 2', subject: 'BME', number: '51b', units: 4, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Programming for Biologists and Biochemists', subject: 'BME', number: '60', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Programming for Biologists and Biochemists Laboratory', subject: 'BME', number: '60l', units: 1, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Bioethics in the 21st Century: Science, Business, and Society', subject: 'BME', number: '80g', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'The Human Genome', subject: 'BME', number: '80h', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'The Genetic Revolution: Science and Technology', subject: 'BME', number: '83', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'BMES Freshman Design Seminar', subject: 'BME', number: '88a', units: 2, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'BME', number: '94', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'BME', number: '94f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'BME', number: '99', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'BME', number: '99f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Applied Electronics for Bioengineers', subject: 'BME', number: '101', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Applied Electronics for Bioengineers Lab', subject: 'BME', number: '101l', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Resource-Efficient Programming', subject: 'BME', number: '109', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computational Biology Tools', subject: 'BME', number: '110', units: 5, season_fall: false, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Extreme Environmental Virology', subject: 'BME', number: '122h', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Bioengineering Project 1', subject: 'BME', number: '123a', units: 7, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Bioengineering Project 2', subject: 'BME', number: '123b', units: 7, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis Presentation', subject: 'BME', number: '123t', units: 2, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Protein Engineering', subject: 'BME', number: '128', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Protein Engineering Laboratory', subject: 'BME', number: '128l', units: 2, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Project Design and Implementation in Biomolecular Engineering I', subject: 'BME', number: '129a', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Project Design and Implementation in Biomolecular Engineering II', subject: 'BME', number: '129b', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Project Design and Implementation in Biomolecular Engineering III', subject: 'BME', number: '129c', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Genomes', subject: 'BME', number: '130', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Bioinstrumentation', subject: 'BME', number: '140', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Molecular Biomechanics', subject: 'BME', number: '150', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Molecular Biomechanics Laboratory', subject: 'BME', number: '150l', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Biotechnology and Drug Development', subject: 'BME', number: '155', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Research Programming in the Life Sciences', subject: 'BME', number: '160', units: 5, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Research Programming in the Life Sciences Laboratory', subject: 'BME', number: '160l', units: 1, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Applied Visualization and Analysis of Scientific Data', subject: 'BME', number: '163', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Frontiers in Drug Action and Discovery', subject: 'BME', number: '170', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Engineering Stem Cells', subject: 'BME', number: '177', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Stem Cell Biology', subject: 'BME', number: '178', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Professional Practice in Bioengineering', subject: 'BME', number: '180', units: 2, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Technical Writing for Biomolecular Engineers', subject: 'BME', number: '185', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Synthetic Biology Mentored Research A', subject: 'BME', number: '188a', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Synthetic Biology Mentored Research B', subject: 'BME', number: '188b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Field Study', subject: 'BME', number: '193', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Field Study', subject: 'BME', number: '193f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'BME', number: '194', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'BME', number: '194f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis Research', subject: 'BME', number: '195', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis or Research', subject: 'BME', number: '195f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'BME', number: '198', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'BME', number: '198f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'BME', number: '199', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Research and Teaching in Bioinformatics', subject: 'BME', number: '200', units: 3, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Scientific Writing', subject: 'BME', number: '201', units: 3, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Bioinformatics Models and Algorithms', subject: 'BME', number: '205', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Biomolecular Recognition', subject: 'BME', number: '207', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Experimental Systems Biology', subject: 'BME', number: '210', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computational Systems Biology', subject: 'BME', number: '211', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Applied Gene Technology', subject: 'BME', number: '215', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Protein Bioinformatics', subject: 'BME', number: '220', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Protein Bioinformatics Laboratory', subject: 'BME', number: '220l', units: 1, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Applied Biotechnology: Engineering Immunotherapeutic Drugs', subject: 'BME', number: '222', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Protein Function in Biology and Bioinformatics', subject: 'BME', number: '225', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Protein Engineering', subject: 'BME', number: '228', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Protein and Cell Engineering', subject: 'BME', number: '229', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computational Genomics', subject: 'BME', number: '230', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Computational Genomics Laboratory', subject: 'BME', number: '230l', units: 1, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'A Technological History of Antibody Genetics', subject: 'BME', number: '233', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Banana Slug Genomics', subject: 'BME', number: '235', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Applied RNA Bioinformatics', subject: 'BME', number: '237', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Stem Cell Research: Scientific, Ethical, Social, and Legal Issues', subject: 'BME', number: '247', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Molecular Biomechanics', subject: 'BME', number: '250', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Molecular Biomechanics Laboratory', subject: 'BME', number: '250l', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Biotechnology and Drug Development', subject: 'BME', number: '255', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Applied Visualization and Analysis of Scientific Data', subject: 'BME', number: '263', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Science and Justice: Experiments in Collaboration', subject: 'BME', number: '268a', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Science and Justice Research Seminar', subject: 'BME', number: '268b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Frontiers in Drug Action and Discovery', subject: 'BME', number: '270', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar on Bioinformatics & Bioengineering', subject: 'BME', number: '280b', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Processive Enzymes and Nanopores', subject: 'BME', number: '281a', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'HIV Vaccine Research', subject: 'BME', number: '281b', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar in Cancer Genomics', subject: 'BME', number: '281c', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Protein Engineering', subject: 'BME', number: '281d', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar in Genomics', subject: 'BME', number: '281e', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Blood Cell Development', subject: 'BME', number: '281f', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Protein Structure and Function', subject: 'BME', number: '281g', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar in Comparative Genomics', subject: 'BME', number: '281h', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Protein Structure Prediction', subject: 'BME', number: '281k', units: 2, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Seminar in Computational Genetics', subject: 'BME', number: '281l', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar in Transcriptomics', subject: 'BME', number: '281n', units: 2, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Seminar on Nanotechnology and Biosensors', subject: 'BME', number: '281p', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar in Computational Functional Genomics', subject: 'BME', number: '281s', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Immunogenomics Seminar', subject: 'BME', number: '281v', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar in Biomolecular Engineering', subject: 'BME', number: '293', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Research in Bioinformatics', subject: 'BME', number: '296', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Study or Research', subject: 'BME', number: '297', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Study or Research', subject: 'BME', number: '297f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Thesis Research', subject: 'BME', number: '299', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: '1', subject: 'CMPM', number: '1', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'test', subject: 'CMPM', number: '2', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to 3D Modeling', subject: 'CMPM', number: '25', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Introduction to 3D Animation', subject: 'CMPM', number: '26', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Foundations of Video Game Design', subject: 'CMPM', number: '80k', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Game Development Experience', subject: 'CMPM', number: '120', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'User Experience for Interactive Media', subject: 'CMPM', number: '131', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Game AI', subject: 'CMPM', number: '146', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Generating Worlds', subject: 'CMPM', number: '147', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Interactive Narrative', subject: 'CMPM', number: '148', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game Engines Lab', subject: 'CMPM', number: '164', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Game Engines Lab', subject: 'CMPM', number: '164l', units: 2, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Game Design Studio I', subject: 'CMPM', number: '170', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Games Design Studio II', subject: 'CMPM', number: '171', units: 7, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Game Design Studio III', subject: 'CMPM', number: '172', units: 7, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game Systems', subject: 'CMPM', number: '176', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Creative Strategies for Designing Interactive Media', subject: 'CMPM', number: '177', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Human-Centered Design Research', subject: 'CMPM', number: '178', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game Design Practicum', subject: 'CMPM', number: '179', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Introduction to Computational Media', subject: 'CMPM', number: '201', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'User Evaluation of Technology', subject: 'CMPM', number: '235', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Artificial Intelligence in Games', subject: 'CMPM', number: '244', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computational Models of Discourse and Dialogue', subject: 'CMPM', number: '245', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Interactive Narrative', subject: 'CMPM', number: '248', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Generative Methods', subject: 'CMPM', number: '265', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar in Human Computer Interaction and Computational Media', subject: 'CMPM', number: '280h', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar in Interactive Systems for Individuals with Special Needs', subject: 'CMPM', number: '280k', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar in Digital Media', subject: 'CMPM', number: '280w', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar on Expressive AI', subject: 'CMPM', number: '280x', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar in Natural Language Processing and Dialogue', subject: 'CMPM', number: '280z', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Playable Media', subject: 'CMPM', number: '290j', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Social and Emotional Approaches to Human Computer Interaction', subject: 'CMPM', number: '290k', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Topics in Computational Cinematography', subject: 'CMPM', number: '290p', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Hands-On Computer Engineering', subject: 'CMPE', number: '1', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Personal Computer Concepts: Software and Hardware', subject: 'CMPE', number: '3', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Statistical Reasoning in the Age of the Internet', subject: 'CMPE', number: '7', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Robot Automation: Intelligence through Feedback Control', subject: 'CMPE', number: '8', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Introduction to Statics Dynamics & Biomechanics', subject: 'CMPE', number: '9', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Fundamentals of Robot Kinematics and Dynamics ', subject: 'CMPE', number: '10', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computer Systems and Assembly Language', subject: 'CMPE', number: '12', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Computer Systems and Assembly Language Laboratory', subject: 'CMPE', number: '12l', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Computer Systems and C Programming', subject: 'CMPE', number: '13', units: 5, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Computer Systems and C Programming Laboratory', subject: 'CMPE', number: '13l', units: 2, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Applied Discrete Mathematics', subject: 'CMPE', number: '16', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Universal Access: Disability, Technology, and Society', subject: 'CMPE', number: '80a', units: 5, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Engineering Ethics', subject: 'CMPE', number: '80e', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'History of Modern Computing', subject: 'CMPE', number: '80h', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Networking and the Internet', subject: 'CMPE', number: '80n', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Ubiquitous and Mobile Computing', subject: 'CMPE', number: '80u', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'CMPE', number: '94', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'CMPE', number: '94f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'CMPE', number: '99', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'CMPE', number: '99f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Logic Design', subject: 'CMPE', number: '100', units: 5, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Logic Design Laboratory', subject: 'CMPE', number: '100l', units: 2, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Probability and Statistics for Engineers (formerly Math Systems:  Stochastic)', subject: 'CMPE', number: '107', units: 5, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Data Compression', subject: 'CMPE', number: '108', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computer Architecture', subject: 'CMPE', number: '110', units: 5, season_fall: false, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Computer and Game Console Architecture', subject: 'CMPE', number: '112', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Parallel Programming', subject: 'CMPE', number: '113', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Solid Mechanics', subject: 'CMPE', number: '115', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Embedded Software', subject: 'CMPE', number: '117', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Embedded Software Laboratory', subject: 'CMPE', number: '117l', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Mechatronics', subject: 'CMPE', number: '118', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Introduction to Mechatronics Laboratory', subject: 'CMPE', number: '118l', units: 2, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Microprocessor System Design', subject: 'CMPE', number: '121', units: 5, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Microprocessor System Design Laboratory', subject: 'CMPE', number: '121l', units: 2, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Introduction to VLSI Digital System Design', subject: 'CMPE', number: '122', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Engineering Design Project I', subject: 'CMPE', number: '123a', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Engineering Design Project II', subject: 'CMPE', number: '123b', units: 7, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Logic Design with Verilog', subject: 'CMPE', number: '125', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Logic Design with Verilog Laboratory', subject: 'CMPE', number: '125l', units: 2, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Logic Design', subject: 'CMPE', number: '126', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Logic Design Laboratory', subject: 'CMPE', number: '126l', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Capstone Project I', subject: 'CMPE', number: '129a', units: 2, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Capstone Project II', subject: 'CMPE', number: '129b', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Capstone Project III', subject: 'CMPE', number: '129c', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Human-Computer Interaction', subject: 'CMPE', number: '131', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computer Interaction of Persons with Limited Vision', subject: 'CMPE', number: '138', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Feedback Control Systems', subject: 'CMPE', number: '141', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Introduction to Cyber-physical Systems', subject: 'CMPE', number: '142', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Estimation and Introduction to Control of Stochastic Processes', subject: 'CMPE', number: '145', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Cyber-physical Systems', subject: 'CMPE', number: '149', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Introduction to Computer Networks', subject: 'CMPE', number: '150', units: 5, season_fall: false, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Introduction to Computer Networks Laboratory', subject: 'CMPE', number: '150l', units: 2, season_fall: false, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Advanced Computer Networks (formerly Network Administration)', subject: 'CMPE', number: '151', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Computer Networks Laboratory', subject: 'CMPE', number: '151l', units: 2, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Analysis and Design of Communication Protocols', subject: 'CMPE', number: '152', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Digital Signal Processing', subject: 'CMPE', number: '153', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Network Programming', subject: 'CMPE', number: '156', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Network Programming Laboratory', subject: 'CMPE', number: '156l', units: 2, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Network Management and Operations', subject: 'CMPE', number: '158', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Mobile Sensing and Interaction', subject: 'CMPE', number: '161', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Sensing and Sensor Technologies', subject: 'CMPE', number: '167', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Sensing and Sensor Technologies Lab', subject: 'CMPE', number: '167l', units: 2, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'High-Speed Digital Design', subject: 'CMPE', number: '173', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'High-Speed Digital Design Laboratory', subject: 'CMPE', number: '173l', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to EDA Tools for PCB Design', subject: 'CMPE', number: '174', units: 3, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Applied Graph Theory and Algorithms', subject: 'CMPE', number: '177', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Technical Writing for Computer Engineers', subject: 'CMPE', number: '185', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Field Study', subject: 'CMPE', number: '193', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Field Study', subject: 'CMPE', number: '193f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'CMPE', number: '194', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'CMPE', number: '194f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis Research', subject: 'CMPE', number: '195', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis Research', subject: 'CMPE', number: '195f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'CMPE', number: '198', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'CMPE', number: '198f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'CMPE', number: '199', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'CMPE', number: '199f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Research and Teaching in Computer Science and Engineering', subject: 'CMPE', number: '200', units: 3, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Computer Architecture', subject: 'CMPE', number: '202', units: 5, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Models of Robotic Manipulation', subject: 'CMPE', number: '215', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Bio-inspired Locomotion', subject: 'CMPE', number: '216', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Mechatronics', subject: 'CMPE', number: '218', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Mechatronics', subject: 'CMPE', number: '218l', units: 2, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Advanced Parallel Processing', subject: 'CMPE', number: '220', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Advanced Microprocessor Design', subject: 'CMPE', number: '221', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Microprocessor Design Laboratory', subject: 'CMPE', number: '221l', units: 3, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'VLSI Digital System Design', subject: 'CMPE', number: '222', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'VLSI System-on-a-Chip Design', subject: 'CMPE', number: '223', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Testing Digital Circuits', subject: 'CMPE', number: '224', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to ASIC Systems Design', subject: 'CMPE', number: '225', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computer-Aided Analysis of Electrical Circuits', subject: 'CMPE', number: '226', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Field-Programmable Gate Arrays Computer-Assisted Design', subject: 'CMPE', number: '229', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computer Performance Evaluation', subject: 'CMPE', number: '230', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Human-Computer Interaction', subject: 'CMPE', number: '231', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Arithmetic Processors', subject: 'CMPE', number: '232', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Human Factors', subject: 'CMPE', number: '233', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'User Evaluation of Technology', subject: 'CMPE', number: '235', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Linear Dynamical Systems', subject: 'CMPE', number: '240', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Introduction to Feedback Control Systems', subject: 'CMPE', number: '241', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Applied Feedback Control', subject: 'CMPE', number: '242', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'System Identification', subject: 'CMPE', number: '243', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Digital Control', subject: 'CMPE', number: '244', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Estimation and Introduction to Control of Stochastic Processes', subject: 'CMPE', number: '245', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Hybrid Dynamical Systems', subject: 'CMPE', number: '246', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Feedback Control Design', subject: 'CMPE', number: '247', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Games in Design and Control', subject: 'CMPE', number: '248', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Cyber-physical Systems', subject: 'CMPE', number: '249', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Multimedia Systems', subject: 'CMPE', number: '250', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Error-Control Coding', subject: 'CMPE', number: '251', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computer Networks', subject: 'CMPE', number: '252a', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Principles of Computer Communication', subject: 'CMPE', number: '252b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Network Security', subject: 'CMPE', number: '253', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'High Speed Computer Networks', subject: 'CMPE', number: '254', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Design Project in Computer Networks', subject: 'CMPE', number: '256', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Wireless and Mobile Networks', subject: 'CMPE', number: '257', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Unix Networking Internals', subject: 'CMPE', number: '258', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Sensor Networks', subject: 'CMPE', number: '259', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Data Compression', subject: 'CMPE', number: '263', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Image Analysis and Computer Vision', subject: 'CMPE', number: '264', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Software Engineering', subject: 'CMPE', number: '276', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Graph Algorithms', subject: 'CMPE', number: '277', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to the Theory of Discrete Systems', subject: 'CMPE', number: '278', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar on Bioinformatics', subject: 'CMPE', number: '280b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar on Control', subject: 'CMPE', number: '280c', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'VLSI/CAD Seminar', subject: 'CMPE', number: '280g', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Networks', subject: 'CMPE', number: '280n', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar on Parallel Processing', subject: 'CMPE', number: '280p', units: 2, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Seminar on New Technologies', subject: 'CMPE', number: '280t', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Computer Vision', subject: 'CMPE', number: '280v', units: 2, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Technical Writing for Engineering Graduates', subject: 'CMPE', number: '285', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Topics in VLSI Computer-Aided Design', subject: 'CMPE', number: '290l', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Topics in Parallel Computation', subject: 'CMPE', number: '290m', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Topics in Computer Performance', subject: 'CMPE', number: '290n', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Topics in Visual Computing', subject: 'CMPE', number: '290v', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Topics in Computer Engineering', subject: 'CMPE', number: '293', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Master Project', subject: 'CMPE', number: '296', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Study or Research', subject: 'CMPE', number: '297', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Thesis Research', subject: 'CMPE', number: '299', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Thesis Research', subject: 'CMPE', number: '299f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computer Literacy', subject: 'CMPS', number: '2', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Programming in C/C++', subject: 'CMPS', number: '5c', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Programming in Java', subject: 'CMPS', number: '5j', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Introduction to Programming in Python', subject: 'CMPS', number: '5p', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Introduction to Computer Science', subject: 'CMPS', number: '10', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Intermediate Programming', subject: 'CMPS', number: '11', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Introduction to Programming (Accelerated)', subject: 'CMPS', number: '12a', units: 5, season_fall: false, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Introduction to Data Structures', subject: 'CMPS', number: '12b', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Computer Programming Laboratory', subject: 'CMPS', number: '12l', units: 2, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Data Structures Laboratory', subject: 'CMPS', number: '12m', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Introduction to Programming and Data Structures (Honors)', subject: 'CMPS', number: '13h', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Programming and Data Structures Laboratory', subject: 'CMPS', number: '13l', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Social Networks', subject: 'CMPS', number: '17', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Game Design Experience', subject: 'CMPS', number: '20', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Computer Graphics: 3D Modeling', subject: 'CMPS', number: '25', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Computer Graphics:  3D Animation', subject: 'CMPS', number: '26', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Beginning Programming: Social Sciences and Humanities', subject: 'CMPS', number: '60g', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Scientific Computation with Matlab and Maple', subject: 'CMPS', number: '60m', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Beginning Programming: Natural Sciences', subject: 'CMPS', number: '60n', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Systems and Simulation', subject: 'CMPS', number: '80b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Social Networks', subject: 'CMPS', number: '80c', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Unix', subject: 'CMPS', number: '80g', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Technology Targeted at Social Issues', subject: 'CMPS', number: '80j', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Foundations of Interactive Game Design', subject: 'CMPS', number: '80k', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Social Data Analytics and Visualization', subject: 'CMPS', number: '80l', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'From Software Innovation to Social Entrepreneurship', subject: 'CMPS', number: '80s', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Creating Virtual Worlds on the Web', subject: 'CMPS', number: '80v', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'CMPS', number: '94', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'CMPS', number: '94f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'CMPS', number: '99', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'CMPS', number: '99f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Algorithms and Abstract Data Types', subject: 'CMPS', number: '101', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Introduction to Analysis of Algorithms', subject: 'CMPS', number: '102', units: 5, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Fundamentals of Compiler Design I', subject: 'CMPS', number: '104a', units: 5, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Fundamentals of Compiler Design II', subject: 'CMPS', number: '104b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Systems Programming', subject: 'CMPS', number: '105', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Open Source Programming', subject: 'CMPS', number: '107', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Advanced Programming', subject: 'CMPS', number: '109', units: 5, season_fall: false, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Introduction to Operating Systems', subject: 'CMPS', number: '111', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Comparative Programming Languages', subject: 'CMPS', number: '112', units: 5, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Introduction to Software Engineering', subject: 'CMPS', number: '115', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Software Design Project', subject: 'CMPS', number: '116', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Software Design Project II', subject: 'CMPS', number: '117', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Software for Society', subject: 'CMPS', number: '119', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Mobile Applications', subject: 'CMPS', number: '121', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computer Security', subject: 'CMPS', number: '122', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Distributed Systems: File Sharing, Online Gaming, and More', subject: 'CMPS', number: '128', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Data Storage Systems', subject: 'CMPS', number: '129', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computational Models', subject: 'CMPS', number: '130', units: 5, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Computability and Computational Complexity', subject: 'CMPS', number: '132', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Computability and Computational Complexity', subject: 'CMPS', number: '132w', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Artificial Intelligence', subject: 'CMPS', number: '140', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Machine Learning and Data Mining', subject: 'CMPS', number: '142', units: 5, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Introduction to Natural Language Processing', subject: 'CMPS', number: '143', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game AI', subject: 'CMPS', number: '146', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Interactive Narrative', subject: 'CMPS', number: '148', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Computer Graphics', subject: 'CMPS', number: '160', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Introduction to Computer Graphics Laboratory', subject: 'CMPS', number: '160l', units: 2, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Introduction to Data Visualization', subject: 'CMPS', number: '161', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Data Visualization Lab', subject: 'CMPS', number: '161l', units: 2, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Advanced Computer Graphics and Animation', subject: 'CMPS', number: '162', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Computer Graphics and Animation Lab', subject: 'CMPS', number: '162l', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game Engines', subject: 'CMPS', number: '164', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game Engines Lab', subject: 'CMPS', number: '164l', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Data Programming for Visualization', subject: 'CMPS', number: '165', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Game Theory and Applications I', subject: 'CMPS', number: '166a', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Game Theory and Applications II', subject: 'CMPS', number: '166b', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Game Design Studio I', subject: 'CMPS', number: '170', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Games Design Studio II', subject: 'CMPS', number: '171', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game Design Studio III', subject: 'CMPS', number: '172', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Creative Strategies for Designing Interactive Media', subject: 'CMPS', number: '177', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Human-Centered Design Research', subject: 'CMPS', number: '178', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game Design Practicum', subject: 'CMPS', number: '179', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Database Systems I', subject: 'CMPS', number: '180', units: 5, season_fall: false, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Database Systems', subject: 'CMPS', number: '180w', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Database Systems II', subject: 'CMPS', number: '181', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Database Management Systems', subject: 'CMPS', number: '182', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Web Applications', subject: 'CMPS', number: '183', units: 5, season_fall: false, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Technical Writing and Communication in Computer Science', subject: 'CMPS', number: '185', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Methods of Cryptography', subject: 'CMPS', number: '190x', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computer Science and Technology Seminar', subject: 'CMPS', number: '191', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Supervised Student Teaching/Tutoring', subject: 'CMPS', number: '192', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Supervised Student Teaching/Tutoring', subject: 'CMPS', number: '192f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Field Study', subject: 'CMPS', number: '193', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Field Study', subject: 'CMPS', number: '193f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'CMPS', number: '194', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'CMPS', number: '194f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis Research', subject: 'CMPS', number: '195', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis Research', subject: 'CMPS', number: '195f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'CMPS', number: '198', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'CMPS', number: '198f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'CMPS', number: '199', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'CMPS', number: '199f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Research and Teaching in Computer Science and Engineering', subject: 'CMPS', number: '200', units: 3, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Analysis of Algorithms', subject: 'CMPS', number: '201', units: 5, season_fall: false, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Programming Languages', subject: 'CMPS', number: '203', units: 5, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Compiler Design', subject: 'CMPS', number: '204', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computational Models and Complexity', subject: 'CMPS', number: '210', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Combinatorial Algorithms', subject: 'CMPS', number: '211', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Logic in Computer Science', subject: 'CMPS', number: '217', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Foundations of Data Science', subject: 'CMPS', number: '218', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Operating Systems', subject: 'CMPS', number: '221', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Computer Security', subject: 'CMPS', number: '223', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Storage Systems', subject: 'CMPS', number: '229', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Distributed Systems', subject: 'CMPS', number: '232', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Artificial Intelligence', subject: 'CMPS', number: '240', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Knowledge Engineering', subject: 'CMPS', number: '241', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Machine Learning', subject: 'CMPS', number: '242', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Artificial Intelligence in Games', subject: 'CMPS', number: '244', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computational Models of Discourse and Dialogue', subject: 'CMPS', number: '245', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'AI:  Problem Solving and Intelligent Search', subject: 'CMPS', number: '247', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Interactive Narrative', subject: 'CMPS', number: '248', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Information Theory', subject: 'CMPS', number: '250', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Advanced Programming Languages', subject: 'CMPS', number: '253', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Computer Graphics', subject: 'CMPS', number: '260', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Visualization', subject: 'CMPS', number: '261', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Computer Animation', subject: 'CMPS', number: '262', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Data Driven Discovery and Visualization', subject: 'CMPS', number: '263', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Generative Methods', subject: 'CMPS', number: '265', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Evolutionary Game Theory', subject: 'CMPS', number: '272', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Software Engineering', subject: 'CMPS', number: '276', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Principles of Database Systems', subject: 'CMPS', number: '277', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Design and Implementation of Database Systems', subject: 'CMPS', number: '278', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Software Reuse and Component-Based Software Engineering', subject: 'CMPS', number: '279', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar in Computer Science Research', subject: 'CMPS', number: '280a', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar in Database Systems', subject: 'CMPS', number: '280d', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Software Engineering', subject: 'CMPS', number: '280g', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar in Human Computation Systems', subject: 'CMPS', number: '280h', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar on Computer Graphics', subject: 'CMPS', number: '280j', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar on Machine Learning', subject: 'CMPS', number: '280m', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Computer Systems', subject: 'CMPS', number: '280s', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar in Digital Media', subject: 'CMPS', number: '280w', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar on Expressive AI', subject: 'CMPS', number: '280x', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar in Natural Language Processing and Dialogue', subject: 'CMPS', number: '280z', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Topics in Algorithms and Complexity Theory: Probabilistic Algorithms and Average Case Analysis', subject: 'CMPS', number: '290a', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Topics in Computer Graphics', subject: 'CMPS', number: '290b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Topics in Machine Learning', subject: 'CMPS', number: '290c', units: 5, season_fall: true, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Neural Computation', subject: 'CMPS', number: '290d', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Object-Oriented Programming Methodology', subject: 'CMPS', number: '290e', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Applications of Combinatorics', subject: 'CMPS', number: '290f', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Topics in Software Engineering', subject: 'CMPS', number: '290g', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Topics in Database Systems', subject: 'CMPS', number: '290h', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Internet Technology and Policy', subject: 'CMPS', number: '290i', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Playable Media', subject: 'CMPS', number: '290j', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Topics in Crowdsourcing and Collaboration', subject: 'CMPS', number: '290l', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Information Extraction', subject: 'CMPS', number: '290m', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Topics in Computational Cinematography', subject: 'CMPS', number: '290p', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Topics in Programming Languages', subject: 'CMPS', number: '290q', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Topics in Computer Systems', subject: 'CMPS', number: '290s', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Topics in Computing for Society', subject: 'CMPS', number: '290t', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Cryptography and Computer Security', subject: 'CMPS', number: '290x', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Quantum Computing', subject: 'CMPS', number: '290y', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Masters Project', subject: 'CMPS', number: '296', units: 2, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Study or Research', subject: 'CMPS', number: '297', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Study or Research', subject: 'CMPS', number: '297f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Thesis Research', subject: 'CMPS', number: '299', units: 1, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Electronic Circuits', subject: 'EE', number: '70', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Electronic Circuits Laboratory', subject: 'EE', number: '70l', units: 1, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Renewable Energy Sources', subject: 'EE', number: '80j', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Sustainability Engineering and Practice', subject: 'EE', number: '80s', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Modern Electronic Technology and How It Works', subject: 'EE', number: '80t', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Designing a Sustainable Future', subject: 'EE', number: '81c', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'EE', number: '94', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'EE', number: '94f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'EE', number: '99', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'EE', number: '99f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Electronic Circuits', subject: 'EE', number: '101', units: 5, season_fall: false, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Introduction to Electronic Circuits Laboratory', subject: 'EE', number: '101l', units: 2, season_fall: false, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Signals and Systems', subject: 'EE', number: '103', units: 5, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Signals and Systems Lab', subject: 'EE', number: '103l', units: 2, season_fall: true, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Bio-electronics and Bio-instrumentations', subject: 'EE', number: '104', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Micro-Electro-Mechanical-Systems Design', subject: 'EE', number: '115', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Collaborative Sustainability Project Design', subject: 'EE', number: '122a', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Collaborative Sustainability Project Implementation', subject: 'EE', number: '122b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Collaborative Sustainability Project Implementation', subject: 'EE', number: '122c', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Engineering Design Project I', subject: 'EE', number: '123a', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Engineering Design Project II', subject: 'EE', number: '123b', units: 7, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Capstone Project I', subject: 'EE', number: '129a', units: 2, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Capstone Project II', subject: 'EE', number: '129b', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Capstone Project III', subject: 'EE', number: '129c', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Optoelectronics and Photonics', subject: 'EE', number: '130', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Introduction to Optoelectronics Laboratory', subject: 'EE', number: '130l', units: 1, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Electromagnetic Fields and Waves', subject: 'EE', number: '135', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Electromagnetic Fields and Waves Laboratory', subject: 'EE', number: '135l', units: 2, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Engineering Electromagnetics', subject: 'EE', number: '136', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Properties of Materials', subject: 'EE', number: '145', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Properties of Materials Laboratory', subject: 'EE', number: '145l', units: 2, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Communications Systems', subject: 'EE', number: '151', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Introduction to Wireless Communications', subject: 'EE', number: '152', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Digital Signal Processing', subject: 'EE', number: '153', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Feedback Control Systems', subject: 'EE', number: '154', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'RF Hardware Design', subject: 'EE', number: '157', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'RF Hardware Design', subject: 'EE', number: '157l', units: 2, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Analog Electronics', subject: 'EE', number: '171', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Analog Electronics Laboratory', subject: 'EE', number: '171l', units: 2, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Analog Circuits', subject: 'EE', number: '172', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'High-Speed Digital Design', subject: 'EE', number: '173', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'High-Speed Digital Design Laboratory', subject: 'EE', number: '173l', units: 2, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to EDA Tools for PCB Design', subject: 'EE', number: '174', units: 3, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Energy Generation and Control', subject: 'EE', number: '175', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Energy Generation and Control Laboratory', subject: 'EE', number: '175l', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Energy Conversion and Control', subject: 'EE', number: '176', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Energy Conversion and Control Laboratory', subject: 'EE', number: '176l', units: 2, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Power Electronics', subject: 'EE', number: '177', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Power Electronics Laboratory', subject: 'EE', number: '177l', units: 2, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Device Electronics', subject: 'EE', number: '178', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Renewable Energy Sources', subject: 'EE', number: '180j', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Renewable Energy Sources in Practice', subject: 'EE', number: '181j', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Special Topics in Electrical Engineering', subject: 'EE', number: '183', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Special Topics in Electrical Engineering', subject: 'EE', number: '192', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Field Study', subject: 'EE', number: '193', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Field Study', subject: 'EE', number: '193f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis Research', subject: 'EE', number: '195', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis Research', subject: 'EE', number: '195f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'EE', number: '198', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Field Study', subject: 'EE', number: '198f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'EE', number: '199', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'EE', number: '199f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Research and Teaching in Electrical Engineering', subject: 'EE', number: '200', units: 3, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Bio-Electronics And Bio-Instrumentations', subject: 'EE', number: '204', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Nanotechnology', subject: 'EE', number: '211', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to BioMEMS', subject: 'EE', number: '212', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Nanocharacterization of Materials', subject: 'EE', number: '213', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Micro-Electro-Mechanical Systems (MEMS) Design', subject: 'EE', number: '215', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Nanomaterials and Nanometer-scale Device', subject: 'EE', number: '216', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Fundamentals of Nanoelectronics', subject: 'EE', number: '218', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Analog Integrated Circuits', subject: 'EE', number: '221', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'High-Speed Low-Power Integrated Circuit Design', subject: 'EE', number: '222', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Solid State Devices', subject: 'EE', number: '223', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Physical Design of Micro- and Opto-Electronic Packages', subject: 'EE', number: '224', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Basics of Electronics Reliability', subject: 'EE', number: '225', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'CMOS Radio Frequency Integrated Circuit Design', subject: 'EE', number: '226', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Fundamentals of Semiconductor Physics', subject: 'EE', number: '227', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Optical Fiber Communication', subject: 'EE', number: '230', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Optical Electronics', subject: 'EE', number: '231', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Quantum Electronics', subject: 'EE', number: '232', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Fiber Optics and Integrated Optics', subject: 'EE', number: '233', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Liquid Crystal Displays', subject: 'EE', number: '234', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Optical Information Storage and Processing', subject: 'EE', number: '235', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Integrated Biophotonics', subject: 'EE', number: '236', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Feedback Control Systems', subject: 'EE', number: '241', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Electrical Analysis of Electronics Packaging', subject: 'EE', number: '242', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Digital Signal Processing', subject: 'EE', number: '250', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Principles of Digital Communications', subject: 'EE', number: '251', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Wireless Communications', subject: 'EE', number: '252', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Information Theory', subject: 'EE', number: '253', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Multi-user Information Theory', subject: 'EE', number: '254', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Multiple-Antenna Wireless Communications', subject: 'EE', number: '255', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Radar Systems and SAR', subject: 'EE', number: '256', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Error Control Coding', subject: 'EE', number: '261', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Statistical Signal Processing', subject: 'EE', number: '262', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Topics in Coding Theory', subject: 'EE', number: '263', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Image Processing and Reconstruction', subject: 'EE', number: '264', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Inverse Problems', subject: 'EE', number: '265', units: 3, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Neural Implant Engineering', subject: 'EE', number: '270', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar on Integrated Bioelectronics', subject: 'EE', number: '280b', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar on Microscopy and Nanotechnology', subject: 'EE', number: '280i', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar on Micro-Electro-Mechanical Systems (MEMS)', subject: 'EE', number: '280m', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Nanophotonics and Lab-on-Chip Systems', subject: 'EE', number: '280n', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Applied Optics', subject: 'EE', number: '280o', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Quantum Electronics and Nanoelectronics', subject: 'EE', number: '280q', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Guest Seminar Series', subject: 'EE', number: '281', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Special Topics in Electrical Engineering', subject: 'EE', number: '283', units: 3, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Radar, Synthetic Aperture Radar, and ISAR', subject: 'EE', number: '288', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Adaptive Optics for Biological Imaging', subject: 'EE', number: '289', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'EE Graduate Seminar', subject: 'EE', number: '290', units: 1, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tomorrows Professor: Preparing for an Academic Career in Science and Engineering', subject: 'EE', number: '291', units: 3, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Topics in Electrical Engineering', subject: 'EE', number: '293', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Master Project', subject: 'EE', number: '296', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Study or Research', subject: 'EE', number: '297', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Thesis Research', subject: 'EE', number: '299', units: 1, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game Art Intensive', subject: 'GAME', number: '210', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Audio Direction', subject: 'GAME', number: '215', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Professional Development for Game Makers 1', subject: 'GAME', number: '221', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Professional Development for Game Makers II', subject: 'GAME', number: '222', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Professional Development for Games Makers III', subject: 'GAME', number: '223', units: 2, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Fundamentals of Game Engineering', subject: 'GAME', number: '230', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game and Playable Media Studio 1', subject: 'GAME', number: '270', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game & Playable Media Studio II', subject: 'GAME', number: '271', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game & Playable Media Studio III', subject: 'GAME', number: '272', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Game Production Intensive', subject: 'GAME', number: '273', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Business Information Systems', subject: 'ISM', number: '50', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Systems Analysis and Design', subject: 'ISM', number: '58', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Development, Management, and Commercialization of Technology', subject: 'ISM', number: '80a', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Technology Value Chain Networks', subject: 'ISM', number: '80b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Starting a New Technology Company', subject: 'ISM', number: '80c', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'ISM', number: '94', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'ISM', number: '94f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'ISM', number: '99', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'ISM', number: '99f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Management of Technology Seminar', subject: 'ISM', number: '101', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Management of Technology I', subject: 'ISM', number: '105', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Management of Technology II', subject: 'ISM', number: '125', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Financial Engineering & Management in High Technology Firms', subject: 'ISM', number: '130', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Business Strategy and Information Systems', subject: 'ISM', number: '158', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Field Study', subject: 'ISM', number: '193', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Field Study', subject: 'ISM', number: '193f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'ISM', number: '194', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'ISM', number: '194f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis Research', subject: 'ISM', number: '195', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis Research', subject: 'ISM', number: '195f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'ISM', number: '198', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'ISM', number: '198f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'ISM', number: '199', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Optimization in Business', subject: 'ISM', number: '204', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Management of Technology I', subject: 'ISM', number: '205', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Optimization Theory and Applications', subject: 'ISM', number: '206', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Random Process Models in Engineering', subject: 'ISM', number: '207', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'New Product Development', subject: 'ISM', number: '208', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Data Mining and Business Analytics in Knowledge Services', subject: 'ISM', number: '209', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Marketing Analytics and Engineering', subject: 'ISM', number: '210', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'E-Business Technology and Strategy', subject: 'ISM', number: '211', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Organizations and Leadership', subject: 'ISM', number: '215', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Management of Technology II', subject: 'ISM', number: '225', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Financial Engineering and Management in High Technology Firms', subject: 'ISM', number: '230', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Information Technology for Decision Support: an Introduction', subject: 'ISM', number: '240', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Data Mining', subject: 'ISM', number: '245', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Stochastic Optimization in Business Intelligence: Digital Advertising and Online Marketing', subject: 'ISM', number: '250', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Large-Scale Web Analytics and Machine Learning', subject: 'ISM', number: '251', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Information Retrieval', subject: 'ISM', number: '260', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Service Engineering and Management', subject: 'ISM', number: '270', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Graduate Research Seminar', subject: 'ISM', number: '280a', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar on Information Retrieval and Knowledge Management', subject: 'ISM', number: '280i', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Sales and Marketing for Technologists and Engineers', subject: 'ISM', number: '280m', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar Topics', subject: 'ISM', number: '280s', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Topics in Technology & Information Management', subject: 'ISM', number: '293', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Study', subject: 'ISM', number: '297', units: 1, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Thesis Research', subject: 'ISM', number: '299', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Innovation and Entrepreneurship Seminar', subject: 'TIM', number: '20', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Innovation and Entrepreneurship in Practice', subject: 'TIM', number: '21', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Business Information Systems', subject: 'TIM', number: '50', units: 5, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Systems Analysis and Design', subject: 'TIM', number: '58', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Development, Management, and Commercialization of Technology', subject: 'TIM', number: '80a', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Technology Value Chain Networks', subject: 'TIM', number: '80b', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Starting a New Technology Company', subject: 'TIM', number: '80c', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'TIM', number: '94', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'TIM', number: '94f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'TIM', number: '99', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Tutorial', subject: 'TIM', number: '99f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Management of Technology Seminar', subject: 'TIM', number: '101', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Management of Technology I', subject: 'TIM', number: '105', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Entrepreneurial Organization & Leadership', subject: 'TIM', number: '115', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Management of Technology II', subject: 'TIM', number: '125', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Financial Engineering & Management in High Technology Firms', subject: 'TIM', number: '130', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Data Analytics for Water and Energy Management', subject: 'TIM', number: '155', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Business Strategy and Information Systems', subject: 'TIM', number: '158', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Decision Analysis in Management', subject: 'TIM', number: '165', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Game Theory and Applications I', subject: 'TIM', number: '166a', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Field Study', subject: 'TIM', number: '193', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Field Study', subject: 'TIM', number: '193f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'TIM', number: '194', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Group Tutorial', subject: 'TIM', number: '194f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis Research', subject: 'TIM', number: '195', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Senior Thesis Research', subject: 'TIM', number: '195f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'TIM', number: '198', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'TIM', number: '198f', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Individual Study or Research', subject: 'TIM', number: '199', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Introduction to Optimization in Business', subject: 'TIM', number: '204', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Management of Technology I', subject: 'TIM', number: '205', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Optimization Theory and Applications', subject: 'TIM', number: '206', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Random Process Models in Engineering', subject: 'TIM', number: '207', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'New Product Development', subject: 'TIM', number: '208', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Data Mining and Business Analytics in Knowledge Services', subject: 'TIM', number: '209', units: 5, season_fall: false, season_winter: false, season_spring: true)

  courses << Course.create(title: 'Marketing Analytics and Engineering', subject: 'TIM', number: '210', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'E-Business Technology and Strategy', subject: 'TIM', number: '211', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Organizations and Leadership', subject: 'TIM', number: '215', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Management of Technology II', subject: 'TIM', number: '225', units: 5, season_fall: false, season_winter: true, season_spring: false)

  courses << Course.create(title: 'Financial Engineering and Management in High Technology Firms', subject: 'TIM', number: '230', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Information Technology for Decision Support: an Introduction', subject: 'TIM', number: '240', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Data Mining', subject: 'TIM', number: '245', units: 5, season_fall: true, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Stochastic Optimization in Business Intelligence: Digital Advertising and Online Marketing', subject: 'TIM', number: '250', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Large-Scale Web Analytics and Machine Learning', subject: 'TIM', number: '251', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Information Retrieval', subject: 'TIM', number: '260', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Service Engineering and Management', subject: 'TIM', number: '270', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Graduate Research Seminar', subject: 'TIM', number: '280a', units: 2, season_fall: false, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Seminar on Information Retrieval and Knowledge Management', subject: 'TIM', number: '280i', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Sales and Marketing for Technologists and Engineers', subject: 'TIM', number: '280m', units: 2, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Seminar Topics', subject: 'TIM', number: '280s', units: 2, season_fall: true, season_winter: true, season_spring: true)

  courses << Course.create(title: 'Special Topics in Technology Information Management', subject: 'TIM', number: '283', units: 3, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Advanced Topics in Technology & Information Management', subject: 'TIM', number: '293', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Master Project', subject: 'TIM', number: '296', units: 5, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Independent Study', subject: 'TIM', number: '297', units: 1, season_fall: false, season_winter: false, season_spring: false)

  courses << Course.create(title: 'Thesis Research', subject: 'TIM', number: '299', units: 5, season_fall: false, season_winter: false, season_spring: false)

end


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

if reload_courses
  student.courses << courses[0]
  timeline.quarters[0].courses << courses[0]
  timeline.quarters[0].courses << courses[1]
  timeline.quarters[1].courses << courses[2]
  timeline.quarters[1].courses << courses[3]
end
# courses[0].concurrent_children << courses[1]
