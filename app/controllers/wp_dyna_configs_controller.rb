class WpDynaConfigsController < ApplicationController
  # GET /wp_dyna_configs
  # GET /wp_dyna_configs.json
  def index
    @wp_dyna_configs = WpDynaConfig.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wp_dyna_configs }
    end
  end

  # GET /wp_dyna_configs/1
  # GET /wp_dyna_configs/1.json
  def show
    @wp_dyna_config = WpDynaConfig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wp_dyna_config }
    end
  end

  # GET /wp_dyna_configs/new
  # GET /wp_dyna_configs/new.json
  def new
    @wp_dyna_config = WpDynaConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wp_dyna_config }
    end
  end

  # GET /wp_dyna_configs/1/edit
  def edit
    @wp_dyna_config = WpDynaConfig.find(params[:id])
  end

  # POST /wp_dyna_configs
  # POST /wp_dyna_configs.json
  def create
    @wp_dyna_config = WpDynaConfig.new(params[:wp_dyna_config])

    respond_to do |format|
      if @wp_dyna_config.save
        format.html { redirect_to @wp_dyna_config, notice: 'Wp dyna config was successfully created.' }
        format.json { render json: @wp_dyna_config, status: :created, location: @wp_dyna_config }
      else
        format.html { render action: "new" }
        format.json { render json: @wp_dyna_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wp_dyna_configs/1
  # PUT /wp_dyna_configs/1.json
  def update
    @wp_dyna_config = WpDynaConfig.find(params[:id])

    respond_to do |format|
      if @wp_dyna_config.update_attributes(params[:wp_dyna_config])
        format.html { redirect_to @wp_dyna_config, notice: 'Wp dyna config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wp_dyna_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_dyna_configs/1
  # DELETE /wp_dyna_configs/1.json
  def destroy
    @wp_dyna_config = WpDynaConfig.find(params[:id])
    @wp_dyna_config.destroy

    respond_to do |format|
      format.html { redirect_to wp_dyna_configs_url }
      format.json { head :no_content }
    end
  end
end
