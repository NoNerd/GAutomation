class TobjectsController < ApplicationController
  # GET /tobjects
  # GET /tobjects.json
  def index
    @tobjects = Tobject.order("id DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tobjects }
    end
  end

  # GET /tobjects/1
  # GET /tobjects/1.json
  def show
    @tobject = Tobject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tobject }
    end
  end

  # GET /tobjects/new
  # GET /tobjects/new.json
  def new
    @tobject = Tobject.new

    respond_to do |format|
            if @tobject.save
      format.html {redirect_to tobjects_path}# new.html.erb
      format.json { render json: @tobject }
      end
    end
  end

  # GET /tobjects/1/edit
  def edit
    @tobject = Tobject.find(params[:id])
  end

  # POST /tobjects
  # POST /tobjects.json
  def create
    @tobject = Tobject.new(params[:tobject])

    respond_to do |format|
      if @tobject.save
        format.html { redirect_to @tobject, notice: 'Tobject was successfully created.' }
        format.json { render json: @tobject, status: :created, location: @tobject }
      else
        format.html { render action: "new" }
        format.json { render json: @tobject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tobjects/1
  # PUT /tobjects/1.json
  def update
    @tobject = Tobject.find(params[:id])

    respond_to do |format|
      if @tobject.update_attributes(params[:tobject])
        format.html { redirect_to @tobject, notice: 'Tobject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tobject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobjects/1
  # DELETE /tobjects/1.json
  def destroy
    @tobject = Tobject.find(params[:id])
    @tobject.destroy

    respond_to do |format|
      format.html { redirect_to tobjects_url }
      format.json { head :no_content }
    end
  end
  
  
  def get_refer_objs
          @refer = params[:refered]
          if @refer == "all"
                  @tobjects = Tobject.page(params[:page])
         elsif @refer == "search"
                 @tobjects = Tobject.where("syn_name like '%#{params["search-info"]}%'").page(params[:page])
         else
                @tobjects = Tobject.where("syn_name like '%#{params[:refered]}%'").page(params[:page])
          end
  end

end
