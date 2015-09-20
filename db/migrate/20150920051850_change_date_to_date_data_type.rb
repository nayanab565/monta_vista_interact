class ChangeDateToDateDataType < ActiveRecord::Migration
  def change
    remove_column :events, :date, :string
    add_column :events, :date, :date
    
  end
end
