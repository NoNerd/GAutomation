class CreateTeststeps < ActiveRecord::Migration
  def change
    create_table :teststeps do |t|
      t.integer :testcase_id
      t.integer :step
      t.string :description
      t.string :step_method
      t.string :obj_name
      t.string :call_method
      t.string :input
      t.string :expect
      t.integer :run

      t.timestamps
    end
  end
end
