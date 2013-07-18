class CreateUrlPerformances < ActiveRecord::Migration
  def change
    create_table :url_performances do |t|
      t.integer :runflag
      t.string :url
      t.string :browser
     t.integer :dyna_id

      t.timestamps
    end
  end
end
