# frozen_string_literal: true

class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :category
  has_many :line_items
  validates :name, :price, :description, :category, presence: true
  validates :price, numericality: true

  paginates_per 5

  mount_uploader :image, ImageUploader

  private

  def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
  end
end
