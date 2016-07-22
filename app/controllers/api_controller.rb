class ApiController < ApplicationController
  include JSONAPI::ActsAsResourceController

  after_action :before_api

  def before_api
    Rails.logger.debug("STATUS:".green + " API endpoint triggered.")
  end
end
