class Item < ActiveRecord::Base

  belongs_to :user

  has_many :photos, dependent: :destroy

  validates :user, presence: true
  validates :title, presence: true, length: {maximum: 100}
  validates :address, presence: true
  validates :description, presence: true, length: {maximum: 500}

end
