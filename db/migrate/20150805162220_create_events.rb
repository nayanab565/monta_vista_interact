class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :date
      t.integer :sign_ups
      t.integer :maximum
      t.string :time

      t.timestamps
    end
  end
end
