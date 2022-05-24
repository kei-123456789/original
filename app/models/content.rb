class Content < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_many_attached :image
  validates :explain, :visit, :image, presence: true
end
