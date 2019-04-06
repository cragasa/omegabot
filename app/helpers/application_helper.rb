# frozen_string_literal: true

module ApplicationHelper
  def cart_count_over_one
    "<span> #{@cart.total_qty}</span>".html_safe if @cart.line_items.count > 0
  end

  def cart_has_items
    @cart.line_items.count > 0
  end
end
