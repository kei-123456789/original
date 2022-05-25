class Content < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_one_attached :image
  validates :explain, :visit, :image, presence: true
end
