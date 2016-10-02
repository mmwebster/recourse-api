# pagination (for admin routes)
JSONAPI.configure do |config|
  # built in paginators are :none, :offset, :paged
  config.default_paginator = :offset

  config.default_page_size = 2
  config.maximum_page_size = 50
end
