class Admin::DashboardController < ApplicationController
  def show
    @category_count = Category.count(:all)
    @product_count = Product.count(:all)
  end
end
