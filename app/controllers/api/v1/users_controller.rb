class Api::V1::UsersController < ApiController
  skip_before_action :authenticate_user!, only: [:create]
end
