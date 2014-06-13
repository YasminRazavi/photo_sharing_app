class PhotosController < ApplicationController
  
  before_filter :authenticate_user!, except: [:index, :show]
  

  # GET /photos
  # GET /photos.json
  def index
    @photos = if params[:id].present?
      if params[:limit]
        Collection.find(params[:id]).photos.order("created_at DESC").limit(4)
      else
        Collection.find(params[:id]).photos.order("created_at DESC")
      end
    else
      Photo.ranked
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  def like
    @photo= Photo.find(params[:photo_id])
    if current_user.liked? @photo
      current_user.unlike @photo
    else
      @photo.liked_by current_user
    end
    liked_status = current_user.liked? @photo
    respond_to do |format|
      # format.html # show.html.erb
      format.json { render json: @photo.as_json(liked_status) }
    end
  end
  
  def search_results
    tag =  params[:q].values.first
    puts(tag)
    @photos= @q.result(distinct: true).to_a
    @photos += Photo.tagged_with(tag).flatten
    @photos.uniq!
    respond_to do |format|
      format.html 
      format.json { render json: @photos }
    end
  end


  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
    liked_status = ""
    liked_status = (current_user.liked? @photo) if current_user
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo.as_json(liked_status) }
      
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new
    authorize! :new, @photo
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
    authorize! :edit, @photo
  end

  # POST /photos
  # POST /photos.json
  def create
    create_new_collection_if_needed
    @photo = Photo.new(params[:photo])
    @photo.user = current_user
    authorize! :create, @photo
    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo.collection, notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])
    authorize! :update, @photo
    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo.collection, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    authorize! :destroy, @photo
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  def tagged
    if params[:tag].present? 
      @photos = Photo.tagged_with(params[:tag])
    else 
      @photos = Photo.postall
    end  
  end

  # def vote 
  #   current_user
  #   puts "#{current_user.first_name} liked me!!"
  #   @photo = Photo.find(params[:id])
  #   @photo.liked_by current_user
  #   liked_status = current_user.liked? @photo
  #   # redirect_to photo_path(@photo)
  #   respond_to do |format|
  #     # format.html # show.html.erb
  #     format.json { render json: @photo.as_json(liked_status) }
  #   end
  # end

  private

  def create_new_collection_if_needed
    if params[:photo][:collection_id] == "new"
      collection = Collection.create!(params[:collection].merge(user: current_user))
      params[:photo][:collection_id] = collection.id
    end
  end


end
