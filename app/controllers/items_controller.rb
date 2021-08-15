class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show ]

    def index
        @items = Item.all
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

    def edit
        unless current_user.id == @item.user_id
            redirect_to action: :index
        end
    end
    
    def update
        @item.update(item_params)
        if @item
            redirect_to root_path
        else
            render :edit
        end
    end

    def show  
    end

    private
    def item_params
     params.require(:item).permit(:image, :name, :product_description, :price, :application_record_id, :category_id, :prefecture_id, :product_condition_id, :shipping_charge_id, :shipping_date_id ).merge(user_id: current_user.id)
    end

    def set_Item
        @item = Item.find(params[:id])
    end

    def update
        unless current_user.id == @item.user_id
            redirect_to action: :index
        end
    end
end
