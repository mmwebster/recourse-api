require 'pry'
# require 'lib/worker'
class Api::V1::TimelinesController < ApiController
  # TODO: implement map function in the create timeline action on this controller
  def update
    if params[:data][:attributes][:sync]
      # Set sync back to false
      params[:data][:attributes][:sync] = false
      # Create and set decision tree for jsonapi-resources to save
      decision_tree_raw = create_decision_tree.tree
      params[:data][:attributes][:tree] = decision_tree_raw.to_json
      # Set on params that decision tree must be resolved
      params[:data][:attributes]['tree-resolved'] = false
    end
    # Call default action
    super
  end

  # @desc Assumes that every node in each record's tree has up-to-date id
  #       information, allowing the corresponding records to fetched.
  # TODO: Current problem is that recursively fetching every record for a
  #       decision tree is both inefficient and slow. It would be better to
  #       fetch all neccessary records in bulk, but that would require prior
  #       knowledge of the nested associations. One possiblity is creating an
  #       associated records hash on degree majors/minors that's updated
  #       whenever their req tree changes. For now, opting into the slow and
  #       inefficient method to save dev time.
  def create_decision_tree
    Rails.logger.debug("TIMELINE: ".green + "Creating decision tree...")
    # get all records containing req trees
    req_tree_records = []
    req_tree_records << current_user.timelines.where(is_current: true).first.degree_majors
    req_tree_records << current_user.timelines.where(is_current: true).first.degree_minors
    req_tree_records.flatten!
    # get all completed course records
    completed_course_records = current_user.courses

    return Worker::Prepare::DecisionTree.new(current_user, req_tree_records, completed_course_records)
  end

  def map
    Rails.logger.debug("TIMELINE: ".green + "Performing map...")

    # perform the steps detailed in previously determined algorithms
    # binding.pry
  end

end
