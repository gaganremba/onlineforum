class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  validates :content, presence: true
  validates_length_of :content, minimum: 1, maximum: 100
end
