class OrdersController < ApplicationController
    before_action :authenticate_user!, except: :index
    before_action :set_item, only: [:create, :index]

    def index
      @formobject = Formobject.new
      @order = Order.new
    end
  
    def create
      @formobject = Formobject.new(order_params)
      if @formobject.valid?
        pay_item
        @formobject.save
        redirect_to root_path
      else
        render :index
      end

    end
  
    private
    def order_params
      params.require(:formobject).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency:'jpy'
      )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
end
