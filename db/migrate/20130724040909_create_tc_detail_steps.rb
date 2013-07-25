class CreateTcDetailSteps < ActiveRecord::Migration
  def change
    create_table :tc_detail_steps do |t|
      t.string :belong_ids
      t.string :description
      t.integer :testcase_id

      t.timestamps
    end
  end
end
