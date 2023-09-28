class Article < ApplicationRecord
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title,presence: true, length: {minimum:6,maximum:100}
  validates :description,presence:true, length: {minimum:10,maximum:500}
  belongs_to :user
  has_one_attached :main_image
  validates :main_image, attached: true,content_type: ['image/png','image/jpg',"jpeg"],size: { less_than: 100.megabytes , message: 'is too large' }

end