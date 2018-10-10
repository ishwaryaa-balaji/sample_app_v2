class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
  @product = Product.find(params[:id])
  end
  def add_item
    sample_properties = {
    'deal' => {
    'Name' => Product.find_by_id(params[:id]).product_name,
   'Deal value' => Product.find_by_id(params[:id]).product_rate
  }
}

  FreshsalesAnalytics::identify(cookies[:user_email], sample_properties) 	 
 	flash[:alert] = "Product added to cart successfully"
  redirect_to products_path(alert: true)
  	FreshsalesAnalytics::trackEvent(cookies[:user_email], 'Product added to cart successfully')
  end

   def add_wish
  redirect_to products_path(alert: true)
 	flash[:alert] = "Product added to wish list successfully"
  	FreshsalesAnalytics::trackEvent(cookies[:user_email], 'Product added to wish list successfully')
  end

  def checkout
  redirect_to products_path(alert: true)
 	flash[:alert] = "Thanks for buying"
  	FreshsalesAnalytics::trackEvent(cookies[:user_email], 'Checkout')
  end
end

