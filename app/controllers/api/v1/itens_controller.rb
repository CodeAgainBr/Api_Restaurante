class Api::V1::ItensController < ApplicationController
	before_action :set_item, only: [:show, :update, :destroy]

	# GET /api/v1/item
	def index
		pedido = pedido.where(mesa: params[:mesa], status: "aberto")[0]
	  @itens = Item.where(pedido: pedido)
	 
	  render json: @itens
	end

	# GET /api/v1/item/1
	def show
		render json: @item
	end

	# POST /api/v1/item
	def create
		@item = Item.new(item_params)

		if @item.save
			render json: @item, status: :created
		else
			render json: @item.errors, status: :unprocessable_entity
		end
	end
 
	# PATCH/PUT /api/v1/item/1
	def update
		if @item.update(item_params)
			render json: @item
		else
			render json: @item.errors, status: :unprocessable_entity
		end
	end

	# DELETE /api/v1/item/1
	def destroy
		@item.destroy
	end

	private

		# Use callbacks to share common setup or constraints between actions.
		def set_item
			@item = Item.find(params[:id])
		end

		# Only allow a trusted parameter "white list" through.
		def item_params
			params.require(:item).permit(:produto)
		end
end
