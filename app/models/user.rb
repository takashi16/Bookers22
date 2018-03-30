class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attachment :image
  validates :name, presence: true, uniqueness: true,
  				   length:{ in: 2..20 }
  validates :introduction,length:{ maximum: 50 }


  has_many :books
end
