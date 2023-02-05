class OrdersController < ApplicationController
     before_action :authenticate_user!, except: :index

    def index
        @item = Item.find(params[:item_id])
        @order = Order.new
    end
        
    def new
        @order_address = OrderAddress.new
    end

    def create
      @order_address = OrderAddress.new(order_params)
      if @order_address.valid?
         @order_address.save
         redirect_to root_path
      else
         render :new
      end
    end

    private

  def order_params
    params.permit(user_id: current_user.id, item_id:@item.id)
  end

  def address_params
    params.permit(:post_number, :sender_id, :city, :addresses, :building, :phone_number).merge(order_id: @order.id)
  end

end
