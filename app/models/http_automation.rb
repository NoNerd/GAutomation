class HttpAutomation < ActiveRecord::Base
  attr_accessible :base_id, :description, :env, :expect, :host_id, :hre_type, :url_path
end
