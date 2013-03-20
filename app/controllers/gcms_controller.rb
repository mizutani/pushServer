require "app"
class GcmsController < ApplicationController
before_filter :authenticate_user!
    before_filter :set_app, only: [:show]

    # GET /gcms/index
    def index
        @apps = current_user.apps
    end
    
    # GET /gcms/app/name
    def show
    end

    # GET /gcms/register
    def register
        @app = current_user.apps.build
    end

    # POST /gcms
    def create
        @app = current_user.apps.build app_params
        respond_to do |format|
            if @app.save
                format.html{redirect_to ({:action => 'show', :app_name => @app.name}), notice: 'App was successfully created.'}
                format.json{render action: 'show', status: :created, location: @app}
            else
                format.html{render action: 'register'}
                format.json{render json: @app.errors, status: :unprocessable_entity}
            end
        end
    end

    private
    def set_app
        @app =  current_user.apps.find_by_name(params[:app_name])
    end

    def app_params
        params[:gcm_app]
    end
end
