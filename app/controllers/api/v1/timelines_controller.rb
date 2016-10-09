require 'pry'
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
      # scratch that
      # MAPPING!!!
      map_timeline
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
    # get current user and resolved decision tree
    # current_user = current_user
    resolved_decision_tree = params[:data][:attributes][:tree] # current_user.timelines.where(is_current: true).first.tree
    # 1. get the ids of every course that was selected within the resolved decision tree
    unique_course_info = recur_resolved_decision_tree(resolved_decision_tree['children'].first, {ids: [], parent_rels: {}})
    unique_course_ids = unique_course_info[:ids]
    # contains hash of items [course_id]=>[parent_rel]
    unique_course_parent_rels = unique_course_info[:parent_rels]
    # 2. select the course records for these ids
    unique_courses = Course.where(id: unique_course_ids)
    # 3. for each unique, determinate course
    uniqueCourseNodes = [] # list that will contain all unique course nodes below
    courseNodeLookupDict = {} # dict used to lookup course node in `uniqueCourse` by its cid

    i = 0
    unique_courses.each do |course|
      # default to pre-req just incase not present
      legacy_node = parse_to_legacy_course_format(course, (unique_course_parent_rels[course.id] or 'pre'))
      # required for dfs_connect_node_subtrees (previously performed by
      # appendAndDict function)
      uniqueCourseNodes << legacy_node
      courseNodeLookupDict[legacy_node.course.cid] = i
      i += 1
    end

    # connect the immediate (certain) children
    uniqueCourseNodes.each do |legacy_course_node|
      unless legacy_course_node.tree['children'].empty?
        immediate_children = dfs_find_immediate_certain_children([], legacy_course_node.tree, unique_course_ids, unique_courses)
        legacy_course_node.children = immediate_children
      end
    end











    head = Worker::Compute::Node.new([],nil,8,nil,nil,true) # head of the final tree passed mapTimeline


    # connect all subtrees so that can sort uniqueCourseNodes by num descendents
    uniqueNodesHead = Worker::Compute::Node.new(uniqueCourseNodes)
    Worker::Compute::puts_tree(uniqueNodesHead)

    Worker::Compute::dfs_connect_node_subtrees(uniqueNodesHead, uniqueCourseNodes, courseNodeLookupDict)

    # sort by num descendents
    Worker::Compute::dfs_sort(uniqueNodesHead, false)
    # puts immediate children of head in list of unique nodes ordered by #descendents in ascending order
    #
    # puts 'New ordering'
    # print '[ '
    # uniqueNodesHead.children.each_with_index do |child, i|
    #   print child.course.cid
    #   if (i < uniqueNodesHead.children.length - 1)
    #       print ','
    #   end
    # end
    # puts ' ]'
    # puts

    def recursiveAddDescendentsToHash(hash, node)
      if (node.children)
        node.children.each do |child|
          hash[child.course.cid] = true
          recursiveAddDescendentsToHash(hash, child)
        end
      end
    end

    # Now get the consolidated one path tree from these one path subtrees
    # descendents is a hash of all course nodes that have parents, and should
    # therefore not exist as immediate children of master head.
    descendents = {} # and roots children at `head.children`
    for node in uniqueNodesHead.children
      # if course node is unique
      if !descendents.key?(node.course.cid)
        # add its children to the unique descendents (that shall not exist in master head.children)
        recursiveAddDescendentsToHash(descendents, node)

        # add the node to head's children
        head.children.push(node)
        # clean head's children of any nodes now present in unique descendents
        i = 0
        length = head.children.length # must do this method b/c removing items from the list while iterating
        while (i < length)
          if descendents.key?(head.children[i].course.cid)
            head.children.delete_at(i)
            i -= 1
            length -= 1 # decrement counter and length after removing item
          end
          i += 1
        end
      end
    end

    # puts 'Immediate children of head of consolidated one-path tree'
    # print '[ '
    # for i in 0...head.children.length
    #   print head.children[i].course.cid
    #   if i < head.children.length - 1
    #     print ','
    #   end
    # end
    # puts ' ]'
    # puts

    completedCourses = fetch_user_completed_courses_hash()
    quarter_records = current_user.timelines.where(is_current: true).first.quarters.order(:start_date)

    quarters = [
                 # Worker::Compute::Quarter.new([], 'fall',   19),
                 # Worker::Compute::Quarter.new([], 'winter', 19),
                 # Worker::Compute::Quarter.new([], 'spring', 19),
                 # Worker::Compute::Quarter.new([], 'fall',   19),
                 # Worker::Compute::Quarter.new([], 'winter', 19),
                 # Worker::Compute::Quarter.new([], 'spring', 19),
                 # Worker::Compute::Quarter.new([], 'fall',   19),
                 # Worker::Compute::Quarter.new([], 'winter', 19),
                 # Worker::Compute::Quarter.new([], 'spring', 19),
                 # Worker::Compute::Quarter.new([], 'fall',   19),
                 # Worker::Compute::Quarter.new([], 'winter', 19),
                 # Worker::Compute::Quarter.new([], 'spring', 19),
                 Worker::Compute::Quarter.new([], 'fall',   quarter_records[0].max_units.to_i),
                 Worker::Compute::Quarter.new([], 'winter', quarter_records[1].max_units.to_i),
                 Worker::Compute::Quarter.new([], 'spring', quarter_records[2].max_units.to_i),
                 Worker::Compute::Quarter.new([], 'fall',   quarter_records[3].max_units.to_i),
                 Worker::Compute::Quarter.new([], 'winter', quarter_records[4].max_units.to_i),
                 Worker::Compute::Quarter.new([], 'spring', quarter_records[5].max_units.to_i),
                 Worker::Compute::Quarter.new([], 'fall',   quarter_records[6].max_units.to_i),
                 Worker::Compute::Quarter.new([], 'winter', quarter_records[7].max_units.to_i),
                 Worker::Compute::Quarter.new([], 'spring', quarter_records[8].max_units.to_i),
                 Worker::Compute::Quarter.new([], 'fall',   quarter_records[9].max_units.to_i),
                 Worker::Compute::Quarter.new([], 'winter', quarter_records[10].max_units.to_i),
                 Worker::Compute::Quarter.new([], 'spring', quarter_records[11].max_units.to_i),
                 # TODO: Check if okay to ommit (no fallback for when not able to plan in 4 years
                 Worker::Compute::Quarter.new([], 'fall',   19),
                 Worker::Compute::Quarter.new([], 'winter', 19),
                 Worker::Compute::Quarter.new([], 'spring', 19),
                 Worker::Compute::Quarter.new([], 'fall',   19),
                 Worker::Compute::Quarter.new([], 'winter', 19),
                 Worker::Compute::Quarter.new([], 'spring', 19)
               ]

    timeline = Worker::Compute::Timeline.new(completedCourses, quarters)

    # puts timeline
    # puts 'Timeline knot:'
    # puts_timeline(timeline)

    # puts co-pt
    # puts 'Current co-pt:'
    # putsTree(head)

    # createTimeline takes as input a consolidated one-path tree
    Worker::Compute::map_timeline(timeline, head)

    # puts 'Finished timeline!!!:'
    # Worker::Compute::puts_timeline(timeline)















    ############################################################
    # TODO: Change it to modify the incoming params to instead pass the data the
    # jsonapi-resource, otherwise the data won't be passed to the client until
    # the next request for the Timeline model. Actually, just reload the
    # timeline on the client side after clearing both flags. It is easier. But
    # in the future, there must be a way to to send back the up-to-date timeline
    # in the response back to the client.
    ############################################################

    # take each quarter from the timeline and set as the current user's timeline
    i = 0
    current_user.timelines.where(is_current: true).first.quarters.each do |quarter| # = timeline.quarters.map do |quarter|
      courses_to_add = []
      timeline.quarters[i].courses.each do |course|
        courses_to_add.append(Course.where(subject: course.subject, number: course.number))
      end

      quarter.courses.delete_all
      quarter.courses << courses_to_add

      i += 1
    end
  end

  # @desc Recurrsively iterates through every node in the resolved decision
  #       tree, and branches only on selected nodes, and add every course along
  #       the way.
  # @update current_ids are now hashes with an id and a parent_rel that's
  #         required by the parse_to_legacy_course_format function
  def recur_resolved_decision_tree(resolved_current_node, current_info)
    # for every child of the current node
    resolved_current_node['children'].each do |child|
      if child['selected']
        # add cid if exists
        if child['type'] == 'course'
          current_info[:ids].push(child['id'])
          current_info[:parent_rels][child['id'].to_i] = child['parentRel']
        end
        # recur
        current_info = recur_resolved_decision_tree(child, current_info)
      end
    end
    current_info[:ids].flatten!
    current_info
  end

  # @desc Format course into what's required by the legacy worker (temporary,
  #       prior to a re-write of the algorithms and data structures contained in
  #       the legacy worker)
  def parse_to_legacy_course_format(course, parent_rel)
    # create the Course
    legacy_course = Worker::Compute::Course.new(course.subject, course.number,
                                         course.title, course.units,
                                         {'fall'=>course.season_fall,
                                          'winter'=>course.season_winter,
                                          'spring'=>course.season_spring
                                         }
                                        )
    # create the Node
    # TODO: add a fourth param for the parent_rel—can't do it quite yet because
    #       that info doesn't comes from the child, which legacy_course is.
    legacy_node = Worker::Compute::Node.new([], legacy_course, 0, parent_rel, nil, false, course.tree)
    return legacy_node
  end

  def dfs_find_immediate_certain_children(current_immediate_children, current_node, unique_course_ids, unique_courses)
    current_node['children'].each do |child|
      if child['type'] == 'pivot'
        # recur on a pivot
        current_immediate_children << dfs_find_immediate_certain_children(current_immediate_children, child, unique_course_ids, unique_courses)
      elsif unique_course_ids.include? child['id']
        # find the course in unique_courses where it's id equals child['id']
        new_course = nil
        new_course_parent_rel = child['parentRel']
        unique_courses.each do |unique_course|
          if unique_course.id == child['id']
            new_course = unique_course
          end
        end
        # append
        current_immediate_children << parse_to_legacy_course_format(new_course, new_course_parent_rel)
      end
    end
    return current_immediate_children.flatten
  end

  def fetch_user_completed_courses_hash
    # completedCourses = {'AMS10' => true, 'AMS20' => true, 'CMPE100' => true, 'CMPE12' => true, 'CMPE13' => true, 'CMPE16' => true, 'CMPE8' => true, 'CMPS12B' => true, 'MATH19A' => true, 'MATH19B' => true, 'MATH23A' => true, 'PHYS5A' => true, 'PHYS5C' => true}
    completed_course_records = current_user.courses
    completed_courses_hash = {}
    completed_course_records.each do |course|
      completed_courses_hash[course.subject.to_s + course.number.to_s] = true
    end
    return completed_courses_hash
  end

end
