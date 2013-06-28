class CreateUrlResults < ActiveRecord::Migration
  def change
    create_table :url_results do |t|
      t.string :url
      t.integer :response_time
      t.string :info
      t.string :browser
      t.timestamps
    end
  end
end
