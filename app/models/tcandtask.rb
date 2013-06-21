class Tcandtask < ActiveRecord::Base
  attr_accessible :task_id, :testcase_id
  belongs_to :task
  belongs_to :testcase
end
