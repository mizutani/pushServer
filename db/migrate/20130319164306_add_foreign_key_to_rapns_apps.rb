class AddForeignKeyToRapnsApps < ActiveRecord::Migration
  def change
    add_column :rapns_apps, :user_id, :integer
  end
end
