class CreateStepResults < ActiveRecord::Migration
  def change
    create_table :step_results do |t|
      t.integer :teststep_id
      t.string :actual
      t.integer :result
      t.string :ipaddress
      t.string :screenshot_path
      t.integer :counter
      t.integer :task_id
      t.integer :testcase_id

      t.timestamps
    end
  end
end
