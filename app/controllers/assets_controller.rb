class AssetsController < ApplicationController  #  Devise::SessionController 
  # skip_before_filter :authenticate_user! #, :only => [:index, :action2]

  def index
    # redis = Redis.new()
    render html: "hi".html_safe
  end
end
