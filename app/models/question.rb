class Question < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  validates_length_of :title, minimum: 1, maximum: 100
  validates_length_of :description, minimum: 1, maximum: 500
  has_many :comments, as: :commentable, dependent: :destroy
end
