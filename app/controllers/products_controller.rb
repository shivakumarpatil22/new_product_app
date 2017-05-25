class ProductsController < ApplicationController
    before_action :get_product, :only=>[:show, :update, :edit, :destroy, :download]
  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 10)
     respond_to do |format|
    format.html # show.html.erb
    format.pdf do
    render :pdf => "product",:template => "products/index.pdf.erb"
      end 
    end
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
    format.html # show.html.erb
    format.pdf do
      render :pdf => "product",:template => "products/show.pdf.erb"
      end 
    end
  end

  def download
   respond_to do |format|
    format.pdf do
    @pdf = WickedPdf.new.pdf_from_string(render_to_string :template => 'products/download.pdf.erb')
    send_data(@pdf, :filename => 'sample.pdf',  :type=>"application/pdf")
    end
   end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(permit_product_params)
   if @product.save
    redirect_to product_path(@product.id)
   else 
    render 'new'
   end
  end

  def update
   if @product.update(permit_product_params)
    redirect_to product_path(@product.id)
   else
    render 'edit'
   end
  end

  def send_mail
    @product = Product.find(params[:id])
    @product.send_email
    flash[:notice] = 'mail sent'
    redirect_to products_path
  end
    
  def edit
  end

  def destroy
  end

  def usermail
  end

  private
  def permit_product_params
    params.require(:product).permit(:product_name, :product_price, :selling_price, :product_stock, :photo)
  end

  def get_product
    @product = Product.find(params[:id])
  end
end


