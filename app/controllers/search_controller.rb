# frozen_string_literal: true

class SearchController < ApplicationController
  def results
    @query = params[:q]

    @search_type = params[:type]

    if @search_type == ''
      @search_results = Product.where('name LIKE ? OR description LIKE ?', "%#{@query}%", "%#{@query}%")
    else
      @search_results = Product.where('(name LIKE ? OR description LIKE ?) AND category_id = ?', "%#{@query}%", "%#{@query}%", @search_type)
    end
    @results_count = @search_results.count
    @search_results = @search_results.page params[:page]
    # @search_results.page(params[:page])
  end
end
