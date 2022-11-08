class ProductsController < ApplicationController

  # GET /products
  def index
    @products = Product.all
    render json: @products
  end

  # GET /products/:id
  def show
    product = Product.find(params[:id])
    render json: product
  end

  # POST /products
  def create

    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
    
  end

  def update

    product = Product.find(params[:id])

    if product.update(product_params)
      render json: product
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def delete
    product = Product.find(params[:id])
    product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :selected, :available, :user_id)
  end
end
