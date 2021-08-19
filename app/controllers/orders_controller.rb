class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create]
    before_action :set_item, only: [:create, :index]
    before_action :object, only: [:create, :index]

    def index
    end
  
    def create
      @formobject = Formobject.new(order_params)
      if @formobject.valid?
        pay_item
        @formobject.save
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

    def object
      if current_user.id == @item.user_id || @item.order.present?  
        redirect_to root_path
      end
    end
end
