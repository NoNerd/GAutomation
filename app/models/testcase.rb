class Testcase < ActiveRecord::Base
  attr_accessible :browser, :capture, :description, :name, :run, :task_ids
  has_many :tcandtestcase
  
  
  def  self.import(file,testcase_id)
          spreadsheet = open_spreadsheet(file)
          header = spreadsheet.row(1)
          (2..spreadsheet.last_row).each do |i|
                  row = Hash[[header,spreadsheet.row(i)].transpose]
                  teststep = Teststep.new
                  teststep.attributes = row.to_hash
                  teststep.testcase_id = testcase_id
                  teststep.save!
          end
  end
  
  def  self.open_spreadsheet(file)
          case File.extname(file.original_filename)
                when ".csv" then Csv.new(file.path, nil, :ignore)
                when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
                when ".xlsx"  then  Roo::Excel.new(file.path,nil, :ignore)
                else raise  "Unknown file type: #{file.original_filename}"
          end
  end
  
end
