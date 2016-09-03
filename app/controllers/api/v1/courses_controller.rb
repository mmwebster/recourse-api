require 'pry'
class Api::V1::CoursesController < ApiController
  before_action :removeTree

  # Remove tree from incoming request if current_user is not admin
  def removeTree
    unless current_user.type == 'Admin'
      if params[:data]
        if params[:data][:attributes][:tree]
          Rails.logger.debug("COURSE: ".green + "Cleaned of tree param")
          params[:data][:attributes].delete(:tree)
        end
      end
    end
  end
end
