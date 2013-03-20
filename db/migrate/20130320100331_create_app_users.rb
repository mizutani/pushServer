class CreateAppUsers < ActiveRecord::Migration
  def change
    create_table :app_users do |t|
      t.string :name
      t.integer :app_id
      t.string :app_name
      t.string :email
      t.string :password
      t.string :auth_key

      t.timestamps
    end
  end
end
