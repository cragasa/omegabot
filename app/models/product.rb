# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :price, :class, :description, presence: true
  validates :price, numericality: true
end
