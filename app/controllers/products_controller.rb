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
 	flash[:alert] = "Yay! Added to cart successfully"
  redirect_to products_path(alert: true)
  	FreshsalesAnalytics::trackEvent(cookies[:user_email], 'Product added to cart successfully')
  end

   def add_wish
  redirect_to products_path(alert: true)
 	flash[:alert] = "Sweet! Added to wish list"
  	FreshsalesAnalytics::trackEvent(cookies[:user_email], 'Product added to wish list successfully')
  end

  def checkout
     properties = {
    'Checkout' => true
  } 
 	flash[:alert] = "Thanks! Your order has been placed"
  redirect_to products_path(alert: true)
  FreshsalesAnalytics::trackEvent(cookies[:user_email], 'Checkout')
  FreshsalesAnalytics::identify(cookies[:user_email], properties)
  end
end

