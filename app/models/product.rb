# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :price, numericality: true
end
