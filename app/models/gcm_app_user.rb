class GcmAppUser < ActiveRecord::Base
    attr_accessible :app_id, :auth_key, :app_user_id
    belongs_to :app_user, :class_name => "AppUser"
    belongs_to :app, :class_name => "App::Gcm::App"
end
