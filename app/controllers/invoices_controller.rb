class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit,:preview, :update, :destroy]
  before_action :authenticate_user!, :except => [:preview]



  def conversation_count

  end



  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
    @clients = Client.order(:name)
    @clients = @clients.where("name like ?", "%#{params[:term]}%") if params[:term]
    respond_to do |format|
    format.html  # index.html.erb
    format.json  { render :json => @clients.map(&:name) }
  end
end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoiceline = Invoiceline.new
    @invoices = Invoice.all
    @invoicelines = Invoiceline.all
    @sum = 0
    @total = @invoicelines.where(:invoice_id => @invoice.id).each do |invoicelin|
      @invoicelin = invoicelin
      if invoicelin.price.present?
        price =   invoicelin.price.to_i
      elsif invoicelin.label.present?
        price =  invoicelin.label.price.to_i
      else
        price = 0
      end
      quantity = invoicelin.quantity.to_i
      @sum+= quantity*price
      @sumttc= @sum*1.20
    end
  end

  def preview
    @invoiceline = Invoiceline.new
    @invoices = Invoice.all
    @invoicelines = Invoiceline.all
    @sum = 0
    @total = @invoicelines.where(:invoice_id => @invoice.id).each do |invoicelin|
      @invoicelin = invoicelin
      if invoicelin.price.present?
        price =   invoicelin.price.to_i
      elsif invoicelin.label.present?
        price =  invoicelin.label.price.to_i
      else
        price = 0
      end
      quantity = invoicelin.quantity.to_i
      @sum+= quantity*price
      @sumttc= @sum*1.20
    end
    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: 'invoice', template: 'invoices/invoice',
        page_size: 'A4',
        encoding:"UTF-8"
      end # Excluding ".pdf" extension.
    end
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Devis cree.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Devis modifie.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Devis supprime.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:author, :status, :invoicetype, :name, :client_id)
    end
  end
