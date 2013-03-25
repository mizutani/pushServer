class GcmNotificationController < ApplicationController
    before_filter :authenticate_user!
    before_filter :set_app

    def notification
        @notification = Rapns::Gcm::Notification.new
    end

    def create
        @notification = Rapns::Gcm::Notification.new(notification_params)
        @notification.app = @app
        @notification.registration_ids = @app.app_users.select(:auth_key).map(&:auth_key)
        respond_to do |format|
            if @notification.save
                 format.html{redirect_to ({:action => 'show', :app_name => @app.name}), notice: 'Notification was successfully created.'}
                format.json{render action: 'show', status: :created, location: @notification}
            else
                 format.html{render action: 'notification'}
                format.json{render json: @notification.errors, status: :unprocessable_entity}
            end
        end
    end
    
    def show
    end
    
    def relayPost
        @notification = Rapns::Gcm::Notification.new(notification_params)
        @notification.app = @app
        respond_to do |format|
            if @notification.save
                format.json{render action: 'show', status: :created, location: @notification}
            else
                format.json{render json: @notification.errors, status: :unproceesable_entry}
            end
        end
    end

    private

    def set_app
        @app = current_user.apps.find_by_name(params[:app_name])
    end

    def notification_params
        data = params[:rapns_gcm_notification][:data]
        params[:rapns_gcm_notification][:data] = {:message=>data}
        params[:rapns_gcm_notification]
    end
end
