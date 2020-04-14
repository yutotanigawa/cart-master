class CartItemsController < ApplicationController
	def index
		@cart_items = CartItem.all
		@books = CartItem.all
	end

	def create
		@book = Book.find(params[:book_id])
		@cart_item = CartItem.new
		@cart_item.title = @book.title
		@cart_item.body = @book.body
		@cart_item.quantity = params[:quantity]
		@cart_item.save
		redirect_to book_cart_items_path
	end

	def destroy_all
		CartItem.destroy_all
		redirect_to root_path
	end

	def update
		@cart_item.update(quantity: params[:quantity].to_i)
        redirect_to book_cart_items_path
	end
end
