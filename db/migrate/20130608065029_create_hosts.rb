class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :url

      t.timestamps
    end
  end
end
