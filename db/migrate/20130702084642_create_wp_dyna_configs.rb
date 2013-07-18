class CreateWpDynaConfigs < ActiveRecord::Migration
  def change
    create_table :wp_dyna_configs do |t|
      t.datetime :start_time
      t.integer :interval_hour
      t.integer :circulate

      t.timestamps
    end
  end
end
