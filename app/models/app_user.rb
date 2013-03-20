class AppUser < ActiveRecord::Base
  attr_accessible :app_id, :auth_key, :email, :name, :password, :app_name
  belongs_to :apps, :class_name => 'App::Gcm::App'

end
