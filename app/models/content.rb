class Content < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_many_attached :images
  validates :explain, :visit, :images, presence: true
  validates :prefecture_id ,numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
