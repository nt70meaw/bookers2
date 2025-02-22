class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthable
devise :database_authenticatable, :registerable,
:recoverable, :rememberable, :validatable
validates :name, presence: true
validates :introduction, presence: true
has_many :books, dependent: :destroy
has_one_attached :profile_image
end
