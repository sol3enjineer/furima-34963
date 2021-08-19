class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show ]
    before_action :set_item, except: [:index, :new, :create ]
    before_action :update_item, only: [:update, :edit, :destroy ]

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
        if current_user.id != @item.user_id || @item.order.present?  
            redirect_to root_path
        end
    end
    
    def update
        if @item.update(item_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    def show
    end

    def destroy
        @item.destroy
            redirect_to root_path
    end

    private
    def item_params
     params.require(:item).permit(:image, :name, :product_description, :price, :application_record_id, :category_id, :prefecture_id, :product_condition_id, :shipping_charge_id, :shipping_date_id ).merge(user_id: current_user.id)
    end

    def set_item
        @item = Item.find(params[:id])
    end

    def update_item
        unless current_user.id == @item.user_id
            redirect_to action: :index
        end
    end
end
