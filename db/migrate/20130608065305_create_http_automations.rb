class CreateHttpAutomations < ActiveRecord::Migration
  def change
    create_table :http_automations do |t|
      t.string :hre_type
      t.string :description
      t.string :base_id
      t.string :expect
      t.integer :host_id
      t.integer :env
      t.string :url_path

      t.timestamps
    end
  end
end
