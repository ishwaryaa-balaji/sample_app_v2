class Product < ActiveRecord::Base
  attr_accessible :author_name, :product_name, :product_rate
end
