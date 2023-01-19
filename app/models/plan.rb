class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  has_many :comments
  has_many :reads, dependent: :destroy

  validates :title,       presence: true
  validates :text,        presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
end
