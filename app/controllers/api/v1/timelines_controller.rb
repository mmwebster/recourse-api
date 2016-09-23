require 'pry'
# require 'lib/worker'
class Api::V1::TimelinesController < ApiController
  # TODO: implement map function in the create timeline action on this
  #       controller. Actually, just make this a before action and then add
  #       guards to ensure it's a requests with timeline data.
  def update
    if params[:data][:attributes][:sync] and !params[:data][:attributes]['tree-resolved']

      # if timeline is resyncing, create the student's up-to-date decision tree
      # for them to resolve
      # Create and set decision tree for jsonapi-resources to save
      decision_tree_raw = create_decision_tree.tree
      params[:data][:attributes][:tree] = decision_tree_raw.to_json
      # Set on params that decision tree must be resolved
      params[:data][:attributes]['tree-resolved'] = false

    elsif params[:data][:attributes][:sync] and params[:data][:attributes]['tree-resolved']

      # if student just resolved their decision tree
      # clear the sync-in-progress flag
      params[:data][:attributes][:sync] = false
      # clear the treeResolved flag
      params[:data][:attributes]['tree-resolved'] = false
      # fetch all of the courses for this school
      legacy_timeline = map_timeline
      # TODO: set timeline to have the quarters in legacy_timeline.quarters
      # ...

    end
    # Call default jsonapi-resources action
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

  # @desc Computes the timeline via legacy worker and returns a lecacy work
  #       Timeline instance
  def map_timeline
    Rails.logger.debug("TIMELINE: ".green + "Performing map...")
    # binding.pry
    # get current user and resolved decision tree
    # current_user = current_user
    resolved_decision_tree = params[:data][:attributes][:tree] # current_user.timelines.where(is_current: true).first.tree
    # get the ids of every course that was selected within the resolved decision tree
    unique_course_ids = recur_resolved_decision_tree(resolved_decision_tree, [])

    # ......
    return {}
  end

  # @desc Recurrsively iterates through every node in the resolved decision
  #       tree, and branches only on selected nodes, and add every course along
  #       the way.
  def recur_resolved_decision_tree(resolved_current_node, current_ids)
    # for every child of the current node
    # binding.pry
    resolved_current_node['children'].each do |child|
      puts "something"
    end
    # -> if selected
    # --->if course node
    # ----->add course's id to current_ids
    # --->recur with self node, and current_ids
  end

end
