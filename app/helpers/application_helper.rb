module ApplicationHelper
  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_path('user.png')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.file.present?
      user.avatar.thumb.url
    else
      asset_path('user.png')
    end
  end

  def item_photo(item)
    photos = item.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('item.jpg')
    end
  end

  def item_thumb(item)
    photos = item.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('item.jpg')
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
