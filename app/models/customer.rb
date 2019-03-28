# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :province
  validates :fullname, :phone, :address, :city, :postalcode, :province_id, presence: true
  canadian_postal_code = /\A[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ -]?\d{1}[A-Z]{1}\d{1}\z/
  validates :postalcode, format: { with: canadian_postal_code }
end
