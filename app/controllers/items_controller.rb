class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  # before_action :item_order ,only: :edit

  def index
    @items = Item.order(id: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
   
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
    redirect_to item_path(@item)
    else
    render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  # def  item_purchase
  #   @item = Item.find(params[:id])
  #    if @item.purchase
  #     redirect_to root_path
  #    end
  # end

  private

  def item_params
    params.require(:item).permit(:name, :price, :comment, :category_id, :item_status_id, 
      :delivery_change_id, :days_to_ship_id, :sender_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end