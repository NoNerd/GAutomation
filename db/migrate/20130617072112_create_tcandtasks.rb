class CreateTcandtasks < ActiveRecord::Migration
  def change
    create_table :tcandtasks do |t|
      t.integer :task_id
      t.integer :testcase_id

      t.timestamps
    end
  end
end
