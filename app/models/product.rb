# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  validates :name, :price, :description, presence: true
  validates :price, numericality: true

  mount_uploader :image, ImageUploader
end
