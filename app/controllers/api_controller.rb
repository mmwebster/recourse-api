class ApiController < ApplicationController
  include JSONAPI::ActsAsResourceController

  # after_filter do
  #   Rails.logger.debug("RESPONSE: ".green + response.body)
  # end
  #
  after_action :before_api

  def before_api
    Rails.logger.debug("STATUS: ".green + " API endpoint triggered.")
  end
end
