class Api::V1::UserController < ApplicationController
  before_action :authenticate_user!
end
