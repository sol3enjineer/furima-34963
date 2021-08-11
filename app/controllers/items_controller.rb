class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    
    def index
        @items = Item.all
    end

    def new
        @item = Item.new
    end

    def create
        #binding.pry
        Item.create(item_params)
        @item = Item.new(item_params)
        if @item.save
            redirect_to root_path
          else
            render :new
        end
    end
      
    private
    def item_params
        params.require(:item).permit(:image, :name, :product_description, :price, :application_record_id, :category_id, :prefecture_id, :product_condition_id, :shipping_charge_id, :shipping_date_id ).merge(user_id: current_user.id)
    end

end
