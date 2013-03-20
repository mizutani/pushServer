class CreateGcmAppUsers < ActiveRecord::Migration
  def change
    create_table :gcm_app_users do |t|
      t.string :app_user_id
      t.string :app_id
      t.string :auth_key

      t.timestamps
    end
  end
end
