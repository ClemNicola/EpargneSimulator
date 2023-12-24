class CreateSimulators < ActiveRecord::Migration[7.1]
  def change
    create_table :simulators do |t|
      t.references :user, null: false, foreign_key: true
      t.string :marital
      t.string :professional
      t.string :children
      t.integer :income

      t.timestamps
    end
  end
end
