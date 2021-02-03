class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_seller!, only: %i[new edit destroy update]


  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    #[render xml: @products
    #render json: @products
  end

  # GET /products/1
  # GET /products/1.json
  def show
    if current_user.present?
      @order = Order.where(user_id: current_user.id)
      
    end

  end

  def search
    if params[:search_key]
      products = Product.where("title LIKE ?","%#{params[:search_key]}%")
      if products
        respond_to do |format|
          format.js {render partial: 'products/search'}
        end
      end
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    

    #@categories = Category.all.map { |c| [c.name, c.id] }
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.category_id = 1
    
   
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
        format.xml { render xml: @product}
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
        format.xml { render xml: @product}
      # else
      #   format.html { render :edit }
      #   format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
      format.xml { render xml: @product}
    end
  end

  # def who_bought
  #   @product = Product.find(params[:id])
  #   @latest_order = @product.orders.order(:updated_at).last
  #   if stale?(@latest_order)
  #     respond_to do |format|
  #       format.atom
  #     end
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price, :category_id)
  end
end
