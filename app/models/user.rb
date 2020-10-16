class User < ApplicationRecord

	validates :name, presence: true, length: { in: 2..20 }
	validates :introduction, length: {maximum: 50}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :image
end
