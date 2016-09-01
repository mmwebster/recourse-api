require 'pry'
class Api::V1::TimelinesController < ApiController

  def update
    if params[:data][:attributes][:sync]
      Rails.logger.debug("MAPPER: ".green + "Syncing timeline...")
      # Set sync back to false
      params[:data][:attributes][:sync] = false
      # Modify the contents of quarters back calling mapping functions
      map
    end
    # Call default action
    super
  end

  # TODO: implement map function in the create timeline action on this controller

  def map
    Rails.logger.debug("MAPPER: ".green + "Performing map...")
  end

end
