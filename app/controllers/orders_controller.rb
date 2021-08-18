class OrdersController < ApplicationController
    before_action :authenticate_user!, except: :index

    def index
        @item = Item.new
        @formobject = Formobject.new
    end
  
    def create
      @formobject = Formobject.new(order_params)
      if @formobject.valid?
        @formobject.save
        redirect_to root_path
      else
        render :index
      end
    end
  
    private
  
    def order_params
      params.require(:formobject).permit(:order, :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id)
    end
end
