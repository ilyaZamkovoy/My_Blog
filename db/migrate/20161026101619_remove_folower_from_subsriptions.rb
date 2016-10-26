class RemoveFolowerFromSubsriptions < ActiveRecord::Migration
  remove_column :subscriptions, :folower
end
