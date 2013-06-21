class CreateRemoteMachines < ActiveRecord::Migration
  def change
    create_table :remote_machines do |t|
      t.string :ipaddress
      t.string :smokescriptpath
      t.string :funcscriptpath
      t.integer :comstatus

      t.timestamps
    end
  end
end
