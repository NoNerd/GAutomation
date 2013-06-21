class TestcaseResult < ActiveRecord::Base
  attr_accessible :counter, :ipaddress, :result, :status, :testcase_id, :task_id
end
