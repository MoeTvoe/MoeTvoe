class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:show]
  before_action :set_current_user_item, only: [:edit, :update, :destroy]
  # GET /items
  def index
    @items = Item.all
  end

  # GET /items/1
  def show
    @new_photo = @item.photos.build(params[:photo])
  end

  # GET /items/new
  def new
    @item = current_user.items.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = current_user.items.build(item_params)

    if @item.save
      redirect_to @item, notice: I18n.t('controllers.items.created')
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: I18n.t('controllers.items.updated')
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to items_url, notice: I18n.t('controllers.items.destroyed')
  end

  private

  def set_current_user_item
    @item = current_user.items.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :address, :description)
  end
end
