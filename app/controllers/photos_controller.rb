class PhotosController < ApplicationController
  before_action :set_item, only: [:create, :destroy]

  before_action :set_photo, only: [:destroy]

  def create
    @new_photo = @item.photos.build(photo_params)

    @new_photo.user = current_user

    if @new_photo.save
      redirect_to @item, notice: I18n.t('controllers.photos.created')
    else
      render 'items/show', alert: I18n.t('controllers.photos.error')
    end
  end

  def destroy
    message = {notice: I18n.t('controllers.photos.destroyed')}

    if current_user_can_edit?(@photo)
      @photo.destroy
    else
      message = {alert: I18n.t('controllers.photos.error')}
    end

    redirect_to @item, message
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.fetch(:photo, {}).permit(:photo)
  end
end
