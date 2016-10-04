class Photo < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  validates :item, presence: true
  validates :user, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

  scope :persisted, -> { where "id IS NOT NULL" }
end
