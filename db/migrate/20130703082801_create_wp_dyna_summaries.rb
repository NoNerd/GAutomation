class CreateWpDynaSummaries < ActiveRecord::Migration
  def change
    create_table :wp_dyna_summaries do |t|
      t.string :url
      t.string :belong_period
      t.integer :impression_best
      t.integer :impression_worst
      t.integer :impression_average
      t.integer :onload_best
      t.integer :onload_worst
      t.integer :onload_average
      t.integer :fullload_best
      t.integer :fullload_worst
      t.integer :fullload_average
      t.integer :render_best
      t.integer :render_worst
      t.integer :render_average
      t.integer :network_best
      t.integer :network_worst
      t.integer :network_average
      t.integer :summary_count
      t.timestamps
    end
  end
end
