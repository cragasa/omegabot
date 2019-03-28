# frozen_string_literal: true

class Customer < ApplicationRecord
  # belongs_to :province
  validates :fullname, :phone, :address, :city, :postalcode, presence: true
end
