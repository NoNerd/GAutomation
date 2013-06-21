class Testcase < ActiveRecord::Base
  attr_accessible :browser, :capture, :description, :name, :run, :task_ids
  has_many :tcandtestcase
end
