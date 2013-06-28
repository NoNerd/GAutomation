class StepResult < ActiveRecord::Base
  attr_accessible :actual, :counter, :ipaddress, :result, :screenshot_path, :teststep_id, :task_id, :testcase_id
end
