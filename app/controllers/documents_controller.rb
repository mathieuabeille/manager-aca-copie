class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :get_folder

  # GET /documents
  # GET /documents.json
  def index
    @documents = @folder.documents
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
    @document.folder = Folder.find(params[:folder_id])
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)
    @document.folder = Folder.find(params[:folder_id])

    respond_to do |format|
      if @document.save
        format.html { redirect_to folder_documents_url, notice: 'Document créé avec succès' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to folder_documents_url, notice: 'Document modifié avec succès' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to folder_documents_url, notice: 'Document créé avec succès' }
      format.json { head :no_content }
    end
  end

  private

  def get_folder
    @folder = Folder.find(params[:folder_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:name, :order, :document, :folder_id)
    end
  end
