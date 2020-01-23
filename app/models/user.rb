class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, minimum: 1, maximum: 100
end
