# frozen_string_literal: true

class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_line_item, only: %i[show edit update destroy]
  before_action :set_cart, only: [:create]

  def index
    @line_items = LineItem.all
  end

  def show; end

  def new
    @line_item = LineItem.new
  end

  def edit; end

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: 'Item added to cart.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = Cart.find(session[:cart_id])
    @line_item = @cart.line_items.find(params[:id])
    @line_item.update_attributes(line_item_params)
    @line_items = @cart.line_items
    redirect_back(fallback_location: '#')
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: 'Item successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id)
  end
end
