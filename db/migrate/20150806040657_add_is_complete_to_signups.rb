class AddIsCompleteToSignups < ActiveRecord::Migration
  def change
    add_column :signups, :is_complete, :boolean
  end
end
