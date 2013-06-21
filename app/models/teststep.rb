class Teststep < ActiveRecord::Base
  attr_accessible :call_method, :description, :expect, :input, :obj_name, :run, :step, :step_method, :testcase_id
end
