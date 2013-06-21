class CreateTobjects < ActiveRecord::Migration
  def change
    create_table :tobjects do |t|
      t.string :syn_name
      t.string :label_types
      t.string :label_attributes
      t.string :attribute_values
      t.string :description

      t.timestamps
    end
  end
end
