class UserlinksController < ApplicationController
  # GET /:id
  def follow
    @userlink = Userlink.find_by_shorturl params[:shorturl]
    redirect_to @userlink.url
    
  end
  # GET /userlinks
  # GET /userlinks.json
  def index
    if params[:tag]
      @userlinks = Userlink.order("created_at desc").tagged_with(params[:tag]).paginate(:page => params[:page])
    else
      @userlinks = Userlink.order("created_at desc").paginate(:page => params[:page])
    end
    @userlink = Userlink.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Userlink.order("created_at desc").to_json(include: :tags) }
    end
  end

  # GET /userlinks/1
  # GET /userlinks/1.json
  def show
    @userlink = Userlink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @userlink }
    end
  end

  # GET /userlinks/new
  # GET /userlinks/new.json
  def new
    @userlink = Userlink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @userlink }
    end
  end

  # GET /userlinks/1/edit
  def edit
    @userlink = Userlink.find(params[:id])
  end

  # POST /userlinks
  # POST /userlinks.json
  def create
    @userlink = Userlink.new(params[:userlink])
    @userlink.shorturl = Userlink.generate_shorturl

    respond_to do |format|
      if @userlink.save
        format.html { redirect_to "/", notice: 'Userlink was successfully created.' }
        format.json { render json: @userlink, status: :created, location: @userlink }
      else
        format.html { render action: "new" }
        format.json { render json: @userlink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /userlinks/1
  # PUT /userlinks/1.json
  def update
    @userlink = Userlink.find(params[:id])

    respond_to do |format|
      if @userlink.update_attributes(params[:userlink])
        format.html { redirect_to @userlink, notice: 'Userlink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @userlink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userlinks/1
  # DELETE /userlinks/1.json
  def destroy
    @userlink = Userlink.find(params[:id])
    @userlink.destroy

    respond_to do |format|
      format.html { redirect_to userlinks_url }
      format.json { head :no_content }
    end
  end
end
