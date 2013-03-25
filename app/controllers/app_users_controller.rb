class AppUsersController < ApplicationController
    before_filter :authenticate_user!, except: [:create]
    before_filter :set_app, except: [:create]
    before_filter :set_app_user , only: [:show, :edit, :update, :destroy]
  # GET /app_users
  # GET /app_users.json
  def index
    @app_users = @app.app_users.all
  end

  # GET /app_users/1
  # GET /app_users/1.json
  def show
  end

  # GET /app_users/new
  # GET /app_users/new.json
  def new
    @app_user = @app.app_users.build
  end

  # GET /app_users/1/edit
  def edit
  end

  # POST /app_users
  # POST /app_users.json
  def create
    @app = App::Gcm::App.find_by_name(params[:app_name])
    @app_user = @app.app_users.build(app_params)
    @app_user.app_id = @app.id
    @app_user.app_name = @app.name
    respond_to do |format|
      if @app_user.save
        format.html { redirect_to ({action:'show', id:@app_user.id}), notice: 'App user was successfully created.' }
          format.json { render json: @app_user, status: :created, location: {:action => 'show', id:@app_user.id} }
      else
        format.html { render action: "new" }
        format.json { render json: @app_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /app_users/1
  # PUT /app_users/1.json
  def update
    respond_to do |format|
      if @app_user.update_attributes(params[:app_user])
          format.html { redirect_to ({action:'show', id:@app_user.id}), notice: 'App user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @app_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_users/1
  # DELETE /app_users/1.json
  def destroy
    @app_user.destroy

    respond_to do |format|
      format.html { redirect_to app_users_url }
      format.json { head :no_content }
    end
  end

  private
    def set_app
        @app = current_user.apps.find_by_name(params[:app_name])
    end
    def set_app_user
        @app_user = @app.app_users.find(params[:id]);
    end
    def app_params
        params[:app_user]
    end
end
