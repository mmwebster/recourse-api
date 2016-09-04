class Api::V1::ReqTreeController < ApiController
  before_action :remove_req_tree
  before_action :clean_req_tree

  # Remove tree from incoming request if current_user is not admin
  def remove_req_tree
    unless current_user.type == 'Admin'
      if params[:data]
        if params[:data][:attributes][:tree]
          Rails.logger.debug("COURSE: ".green + "Removed tree param")
          params[:data][:attributes].delete(:tree)
        end
      end
    end
  end

  # Clean the tree on every request
  def clean_req_tree
    params[:data] = Worker::Maintain.clean_req_tree(current_user, params[:data])
  end
end
