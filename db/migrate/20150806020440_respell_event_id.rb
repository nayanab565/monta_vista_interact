class RespellEventId < ActiveRecord::Migration
  def change
    remove_column :signups, :evennt_id, :integer
    add_column :signups, :event_id, :integer
  end
end
