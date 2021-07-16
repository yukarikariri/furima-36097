class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    # @purchase = @item.purchases.new
  end

  def create
  end
end
