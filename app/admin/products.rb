# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :name, :price, :type, :description, :category_id, :image
end
