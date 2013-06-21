class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :run_counter

      t.timestamps
    end
  end
end
