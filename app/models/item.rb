class Item < ActiveRecord::Base

  belongs_to :user
  validates :user, presence: true

  validates :title, presence: true, length: {maximum: 255}
  validates :description, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :created_at, presence: true

end
