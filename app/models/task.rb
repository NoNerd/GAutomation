class Task < ActiveRecord::Base
  attr_accessible :description, :run_counter
  has_many :tcandtask, :dependent=>:destroy
end
