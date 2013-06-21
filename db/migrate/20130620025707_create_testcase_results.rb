class CreateTestcaseResults < ActiveRecord::Migration
  def change
    create_table :testcase_results do |t|
      t.integer :testcase_id
      t.integer :result
      t.integer :counter
      t.integer :status
      t.string :ipaddress
      t.integer :task_id

      t.timestamps
    end
  end
end
