class CreateTestcases < ActiveRecord::Migration
  def change
    create_table :testcases do |t|
      t.string :name
      t.string :description
      t.string :browser
      t.integer :run
      t.integer :capture

      t.timestamps
    end
  end
end
