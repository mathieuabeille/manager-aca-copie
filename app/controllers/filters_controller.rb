class FiltersController < ApplicationController
  before_action :set_filter, only: [:show, :edit, :update, :destroy]

  # GET /folders/1
  # GET /folders/1.json
  def show
    @filter = Filter.find(params[:id])
  end

  def index
    @filter = Filter.find(params[:id])
  end
  # GET /folders/new
  def new
    @filter = Filter.new
  end

  # GET /folders/1/edit


  # POST /folders
  # POST /folders.json
  def create
    @filter = Filter.new(filter_params)
    @filter.save
    redirect_to @filter
  end

  def update
    respond_to do |format|
      if   @filter.update(filter_params)
        format.html { redirect_to @filter, notice: 'Nouvelle recherche.' }
        format.json { render :index, status: :ok, location: @filter }
      else
        format.html { render :edit }
        format.json { render json: @filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folders/1
  private

  def filter_params
    params.require(:filter).permit(:brand, :company, :location, :supplier, :materialtype )
  end

  def set_filter
    @filter = Filter.find(params[:id])
  end
end
