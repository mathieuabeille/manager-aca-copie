class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit,:preview, :update, :destroy, :create_payment, :new_payment]
  before_action :authenticate_user!, :except => [:preview]
  helper_method :compute_invoice
  helper_method :invoice_number




  # GET /invoices
  # GET /invoices.json
  def index
    @clients = Client.all
    @invoices = Invoice.search(params[:search])
    @Invoices = Invoice.order(:name)
    @invoices = @invoices.page(params[:page] || 1)
    @invoicelines = Invoiceline.all
    respond_to do |format|
    format.html  # index.html.erb
    format.json  { render :json => @clients.map(&:name) }
    @invoicelines = Invoiceline.all


  end
end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
        @user = current_user

    @invoiceline = Invoiceline.new
    @invoices = Invoice.all
    @invoicelines = Invoiceline.all
    @sum = self.compute_invoice(@invoice)

  end

  def compute_invoice(invoice)
    @sum = 0
    @invoice = invoice
    @invoicelines = Invoiceline.all
    @total = @invoicelines.where(:invoice_id => @invoice.id).each do |invoicelin|
      if invoicelin.price.present?
        price =   invoicelin.price.to_i
      elsif invoicelin.label.present?
        price =  invoicelin.label.price.to_i
      else
        price = 0
      end
      @sum += (invoicelin.quantity.to_i*invoicelin.price.to_i)
    end
    return @sum
  end

  def invoice_number(invoice)
    @number = ''
    @invoice = invoice
    @id = @invoice.id.to_s
    @date =  (Date.today.strftime("%Y")+'-'+Date.today.strftime("%m")).to_s
    @number = @date +'-'+ @id
    return @number
  end

  def preview
    @invoiceline = Invoiceline.new
    @invoices = Invoice.all
    @invoicelines = Invoiceline.all
    @sum = 0
    @user = current_user
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
    @amount2 = @sumttc
    @amount = @sumttc*100
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @invoice.status = "Crée"
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to edit_invoice_path(@invoice), notice: 'Devis cree.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /invoices/1/edit
  def edit
    @user = current_user
    @sum = 0
    @clients = Client.all
    @invoiceline = Invoiceline.new
    @invoicelines = Invoiceline.all
      if @clients.where(id: @invoice.client_id).exists?
        @client = @clients.find(@invoice.client_id)
      end
    @clientnew = Client.new
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
        format.html { redirect_to edit_invoice_path(@invoice), notice: 'Devis modifie.' }
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
      params.require(:invoice).permit(:author, :status, :days, :invoicetype, :name, :email,:client_id)
    end
  end
