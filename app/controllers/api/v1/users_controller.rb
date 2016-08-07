class Api::V1::UsersController < ApiController
  skip_before_action :authenticate_user!, only: [:create]
  after_filter do
    Rails.logger.debug "UsersController: ".green + response.body
  end
end
