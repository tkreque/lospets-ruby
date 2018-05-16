class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @status = StatusModel.all
    @animals = AnimalModel.all
    @breeds = BreedModel.all
    
    @pet = Pet.new
    @pet.status=@status.first
    # @breeds = BreedModel.where("type.name" => "?").all
  end

  # GET /pets/1/edit
  def edit
    @status = StatusModel.all
    @animals = AnimalModel.all
    @breeds = BreedModel.all
  end

  # POST /pets
  # POST /pets.json
  def create
    @statusPet = StatusModel.where("name" => params[:pet]["status"]).first
    @breedPet = BreedModel.where("_id" => params[:breed]).first
    @addressPet = Address.new("address" => params[:pet]["address"])
    
    @pet = Pet.new({
      "name" => params[:pet]["name"],
      "status" => @statusPet,
      "breed" => @breedPet,
      "address" => @addressPet,
      "image" => params[:pet]["image"],
      "tag" => params[:pet]["tag"]
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
    
    respond_to do |format|
      if @pet.update(pet_params)
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
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :breed, :status, :address, :user, :image, :tag)
      params[:status] = StatusModel.where("name" => params[:pet]["status"]).first
      params[:breed] = BreedModel.where("_id" => params[:breed]).first
      params[:address] = Address.new("address" => params[:pet]["address"])
    end
    
end
