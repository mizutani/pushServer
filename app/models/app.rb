class App
    module Gcm
        class App < Rapns::Gcm::App
            belongs_to :user
            has_many :app_users
        end
    end
end
