class UrlResult < ActiveRecord::Base
  attr_accessible :response_time, :url, :info, :browser
end
