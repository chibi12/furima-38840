class OrdersController < ApplicationController
     before_action :authenticate_user!, only: [:index, :create]
     before_action :non_order_item,only: [:index, :create]

    def index
      @item = Item.find(params[:item_id])
      @order_address = OrderAddress.new
    end
        
    # def new
    #     @order_address = OrderAddress.new
    # end

    def create
      @item = Item.find(params[:item_id])
      @order_address = OrderAddress.new(order_address_params)
      if @order_address.valid?
         pay_item
         @order_address.save
         redirect_to root_path
      else
         render :index
      end
    end

    private

  def order_address_params
    params.require(:order_address).permit(:post_number, :sender_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  # def address_params
  #   params.permit(:post_number, :sender_id, :city, :addresses, :building, :phone_number).merge(order_id: @order.id)
  # end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(  
      amount: @item.price,
      card: order_address_params[:token],    
      currency: 'jpy'                 
    )
  end
  def non_order_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user || @item.order.present?
  end
 end
