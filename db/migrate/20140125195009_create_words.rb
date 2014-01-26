class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.text :definition
      t.text :example

      t.timestamps
    end
  end
end
