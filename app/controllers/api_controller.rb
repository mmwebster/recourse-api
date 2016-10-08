# WARNING: this controller is not inherited by Api::V1::TimelineMapController
class ApiController < ApplicationController
  include JSONAPI::ActsAsResourceController

  after_action do
    Rails.logger.debug("RESPONSE: ".green + response.body)
  end

  after_action :before_api

  def before_api
    Rails.logger.debug("STATUS: ".green + " API endpoint triggered.")
  end
end
