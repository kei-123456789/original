class Content < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_one_attached :image
  validates :explain, :visit, :image, presence: true
  validates :prefecture_id ,numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture2
end
