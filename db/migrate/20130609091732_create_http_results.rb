class CreateHttpResults < ActiveRecord::Migration
  def change
    create_table :http_results do |t|
      t.integer :http_automation_id
      t.string :actual
      t.string :result

      t.timestamps
    end
  end
end
