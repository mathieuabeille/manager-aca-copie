class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.search(params[:search])
    @filter = Filter.new
  end



  # GET /materials/1
  # GET /materials/1.json
  def show
    @material_comment = MaterialComment.new
    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: 'etiquette.pdf', template: 'materials/show.html.erb'
      end # Excluding ".pdf" extension.
    end
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
  end


  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: 'Materiel ajoute avec succes.' }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: 'Material modifie avec succes.' }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url, notice: 'Materiel supprime avec succes.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def material_params
      params.require(:material).permit(:company,:brand, :materialtype, :supplier, :name, :brand, :serial, :number, :location, :invoice)
    end
  end
