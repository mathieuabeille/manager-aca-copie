class MaterialCommentsController < ApplicationController
  before_action :set_material_comment, only: [:show, :edit, :update, :destroy]

  # GET /material_comments
  # GET /material_comments.json
  def index
    @material_comments = MaterialComment.all
  end

  # GET /material_comments/1
  # GET /material_comments/1.json
  def show
  end

  # GET /material_comments/new
  def new
    @material_comment = MaterialComment.new
  end

  # GET /material_comments/1/edit
  def edit
  end

  # POST /material_comments
  # POST /material_comments.json
  def create
    @material_comment = MaterialComment.new(material_comment_params)
    @material_comment.material = Material.find(params[:material_id])

    respond_to do |format|
      if @material_comment.save
        format.html { redirect_to material_path(@material_comment.material), notice: 'Commentaire ajoute.' }
        format.json { render :show, status: :created, location: @material_comment }
      else
        format.html { render :new }
        format.json { render json: @material_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_comments/1
  # PATCH/PUT /material_comments/1.json
  def update
    respond_to do |format|
      if @material_comment.update(material_comment_params)
        format.html { redirect_to @material_comment, notice: 'Material comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @material_comment }
      else
        format.html { render :edit }
        format.json { render json: @material_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_comments/1
  # DELETE /material_comments/1.json
  def destroy
    @material_comment.destroy
    respond_to do |format|
      format.html { redirect_to material_comments_url, notice: 'Material comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_comment
      @material_comment = MaterialComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def material_comment_params
      params.require(:material_comment).permit(:author, :comment, :material_id)
    end
  end
