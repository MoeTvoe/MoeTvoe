class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}

  before_validation :set_name, on: :create

  mount_uploader :avatar, AvatarUploader

  private

  # задаем юзеру случайное имя, если оно пустое
  def set_name
    self.name = "Меняла №#{rand(777)}" if self.name.blank?
  end
end
