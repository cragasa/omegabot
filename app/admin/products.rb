# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :name, :price, :class, :description
end
