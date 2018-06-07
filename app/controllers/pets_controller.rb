class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all
  end
  
  def my
    @mypets = Pet.where("user" => current_user).all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @user = current_user
  end

  # GET /pets/new
  def new
    @status = StatusModel.all
    @animals = AnimalModel.all
    @breeds = BreedModel.all
    @tags = TagModel.all
    
    @categories = @tags.uniq{|x| x.category}
    
    @pet = Pet.new
    @pet.status=@status.first
  end

  # GET /pets/1/edit
  def edit
    @status = StatusModel.all
    @animals = AnimalModel.all
    @breeds = BreedModel.all
    @tags = TagModel.all
    @address = @pet.address['address']
    
    @categories = @tags.uniq{|x| x.category}
  end

  # POST /pets
  # POST /pets.json
  def create
    @statusPet = StatusModel.where("name" => params[:pet]["status"]).first
    @breedPet = BreedModel.where("_id" => params[:breed]).first
    @addressPet = Address.new("address" => params[:pet]["address"])
    @userPet = current_user._id
    
    @tagPet = []
    tag_ids = params[:tag]
    
    for t in tag_ids 
      @tagPet.push(TagModel.where("_id" => t).first)
    end
    
    @pet = Pet.new({
      "name" => params[:pet]["name"],
      "status" => @statusPet,
      "breed" => @breedPet,
      "address" => @addressPet,
      "image" => params[:pet]["image"],
      "user_id" => @userPet,
      "tag" => @tagPet
    })
    
    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    
    @pet.name = params[:pet]["name"]
    @pet.status = StatusModel.where("name" => params[:pet]["status"]).first
    @pet.breed = BreedModel.where("_id" => params[:breed]).first
    @pet.address = Address.new("address" => params[:pet]["address"])
    
    @tagPet = []
    tag_ids = params[:tag]
    
    for t in tag_ids 
      @tagPet.push(TagModel.where("_id" => t).first)
    end
    @pet.tag = @tagPet
    
    respond_to do |format|
      if @pet.update
      # if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id]) or not_found
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :breed, :status, :address, :user, :image, :tag)
    end
    
end
