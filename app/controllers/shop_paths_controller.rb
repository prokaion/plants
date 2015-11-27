class ShopPathsController< ApplicationController
  
  def index
    @shop = Shop.find(params[:shop_id])
    @paths = Path.shop(@shop)
  end
end