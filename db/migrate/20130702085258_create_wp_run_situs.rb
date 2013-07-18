class CreateWpRunSitus < ActiveRecord::Migration
  def change
    create_table :wp_run_situs do |t|
      t.string :date

      t.timestamps
    end
  end
end
