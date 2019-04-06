# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items
  validates :name, :price, :description, :category, presence: true
  validates :price, numericality: true

  paginates_per 5

  mount_uploader :image, ImageUploader
end
