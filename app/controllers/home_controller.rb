require "redis"

class HomeController < ApplicationController
  skip_before_filter :authenticate_user! , :only => [:index]
  # respond_to :html

  before_action :before_client

  def before_client
    # all actions to be triggered prior to 
    Rails.logger.debug("STATUS:".green + " Client index fetched.")
  end

  def index

    redis_url = Rails.application.config.redis_url

    unless redis_url
      puts "ERROR: Failed to retrieve Redis URL"
    else
      # --> SUCCESS
      redis = Redis.new(:url => Rails.application.config.redis_url)
      unless redis
        puts "ERROR: Failed to connect to Redis"
      else
        # --> SUCCESS
        index = redis.get('reqourse-client:index:current-content')
        unless index
          puts "ERROR: unable to retrieve index.html from Redis"
        else
          # --> SUCCESS
          puts "SUCCESS: properly loaded index from redis"
          Rails.logger.debug("SUCCESS".green + ": properly loaded index from redis")
          render html: index.html_safe
        end
      end
    end

  end

end
