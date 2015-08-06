class RemoveUserIdEventIdAddHours < ActiveRecord::Migration
  def change
    remove_column :users, :event_id, :integer
    remove_column :events, :user_id, :integer
    add_column :users, :hours, :float
  end
end
