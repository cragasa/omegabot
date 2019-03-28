# frozen_string_literal: true

ActiveAdmin.register Customer do
  permit_params :fullname, :phone, :address, :city, :postalcode, :province_id
end
