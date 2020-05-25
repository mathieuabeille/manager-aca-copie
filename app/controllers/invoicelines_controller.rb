class InvoicelinesController < ApplicationController
  before_action :set_invoiceline, only: [:show, :edit, :update, :destroy]

  # GET /invoicelines
  # GET /invoicelines.json
  def index
    @invoicelines = Invoiceline.all
  end

  # GET /invoicelines/1
  # GET /invoicelines/1.json
  def show
  end

  # GET /invoicelines/new
  def new
    @invoiceline = Invoiceline.new
  end

  # GET /invoicelines/1/edit
  def edit
  end

  # POST /invoicelines
  # POST /invoicelines.json
  def create
    @invoiceline = Invoiceline.new(invoiceline_params)

    respond_to do |format|
      if @invoiceline.save
        format.html { redirect_to @invoiceline, notice: 'Invoiceline was successfully created.' }
        format.json { render :show, status: :created, location: @invoiceline }
      else
        format.html { render :new }
        format.json { render json: @invoiceline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoicelines/1
  # PATCH/PUT /invoicelines/1.json
  def update
    respond_to do |format|
      if @invoiceline.update(invoiceline_params)
        format.html { redirect_to @invoiceline, notice: 'Invoiceline was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoiceline }
      else
        format.html { render :edit }
        format.json { render json: @invoiceline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoicelines/1
  # DELETE /invoicelines/1.json
  def destroy
    @invoiceline.destroy
    respond_to do |format|
      format.html { redirect_to invoicelines_url, notice: 'Invoiceline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoiceline
      @invoiceline = Invoiceline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoiceline_params
      params.require(:invoiceline).permit(:name, :price, :quantity)
    end
end
